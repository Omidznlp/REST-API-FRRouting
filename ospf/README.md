
# Configuration, and Test OSPF

## Configuration
OSPF supports multiple instances.it must be enabled before testing. To do, `ospfd=no` must be changed in the following manner.  
```
...
ospfd=yes
ospfd_instances=1,2,3
...
```
`Note:`\
Implemented parameters are referred to in https://docs.frrouting.org/en/latest/ospfd.html. \
For supporting multi-instance, please check the following link:
[https://frrouting.readthedocs.io/en/latest/ospfd.html#multi-instance-support][https://frrouting.readthedocs.io/en/latest/ospfd.html#multi-instance-support]

### Test Requests

**Description:**\

Base urls in this project are based on two types : \
`1.http://localhost:8000/ospf/Basic/ `\
`2.http://localhost:8000/ospf/advanced/` \
`/basic` must be configured to run ospf instances \
`/advanced` is optional \

#### Basic Commands Section
EXP 1:  add one ospf instance
```
$ curl -X POST -d 'id_instance=1&router_id=4.4.4.4&interface_name=ens192&interface_area=1' http://localhost:8000/ospf/basic/

{"id_instance":1,"router_id":"4.4.4.4","interface_name":"ens192","interface_area":1}

Test Frrouting

$ sudo vtysh

This is a git build of fea8db7-dirty
Associated branch(es):
        local:develop
        https://gitlab.network.com/main/dynamic_routing.git/develop

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
!
router ospf 1
 ospf router-id 4.4.4.4

line vty
!
end

test#

```

Exp 2: Update fields
```
Description:

if field does not need to be updated, put filed=

```
```
curl -X PUT -d 'id_instance=1&router_id=5.5.5.5&interface_name=&interface_area=' http://localhost:8000/ospf/basic/detail/1/

{"id_instance":1,"router_id":"5.5.5.5","interface_name":"ens192","interface_area":1}

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
!
router ospf 1
 ospf router-id 5.5.5.5
!
line vty
!
end
```
Exp 3: Get statistics of all instances or one instance
```
# All instances
$ curl -X GET http://localhost:8000/ospf/basic/

[{"id_instance":1,"router_id":"5.5.5.5","interface_name":"ens192","interface_area":1}]

# One instance
$ curl -X GET http://localhost:8000/ospf/basic/1/

[{"id_instance":1,"router_id":"5.5.5.5","interface_name":"ens192","interface_area":1}]

```
Exp 4: Delete instance
```
curl -X DELETE http://localhost:8000/ospf/basic/detail/{1}/
```
#### Advanced Commands Section
**Description:**\
`/advanced/interface/`  brings more options for configuration interface \
`/advanced/area/`  brings more options for configuration area \
`/advanced/global/`  brings more options for configuration global parameters \
which means these options do not need to be configured for running ospf. \
These features give more options for configuration ospf into complex scenario

##### Section Interface

Exp1: add options
```
$ curl -X POST -d 'id_instance=1&name=ens192&hello_interval=10&retransmit_interval=20&transmit_delay=30&dead_interval=20&cost=10&priority=20&network_type=non-broadcast&auth_message_digest=True&auth_key=123&message_digest_key=1&md5_key=test'  http://localhost:8000/ospf/advanced/interface/

{"id_instance":1,"name":"ens192","auth_message_digest":true,"auth_key":"123","message_digest_key":1,"md5_key":"test","cost":10,"dead_interval":20,"hello_interval":10,"retransmit_interval":20,"transmit_delay":30,"priority":20,"network_type":"non-broadcast"}

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 20
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 20
 ip ospf transmit-delay 30
!
router ospf 1
 ospf router-id 4.4.4.4
!
line vty
!
end
```
Exp 2: update options

```
$ curl -X PUT -d 'id_instance=1&name=ens192&hello_interval=10&retransmit_interval=20&transmit_delay=30&dead_interval=20&cost=10&priority=20&network_type=non-broadcast&auth_message_digest=True&auth_key=123&message_digest_key=1&md5_key=test'  http://localhost:8000/ospf/advanced/interface/{1}/

{"id_instance":1,"name":"ens192","auth_message_digest":true,"auth_key":"123","message_digest_key":1,"md5_key":"test","cost":10,"dead_interval":20,"hello_interval":10,"retransmit_interval":20,"transmit_delay":30,"priority":20,"network_type":"non-broadcast"}

test #show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 20
 ip ospf message-digest-key 1 md5 test
 ip ospf message-digest-key 25 md5 1234
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 20
 ip ospf transmit-delay 30
!
router ospf 1
 ospf router-id 4.4.4.4
!
line vty
!
end

```
Exp 3: Get information
```
$ curl -X GET http://localhost:8000/ospf/advanced/interface/

$ curl -X GET http://localhost:8000/ospf/advanced/interface/1/

```
Exp 3: Delete options
```
Note :
Removing some commands from frrouting need to pass value of fields.Therefore,these fields must be passed into body of REST API to remove these commands from Frrouting

$ curl -X DELETE -d 'name=ens192&message_digest_key=1'  http://localhost:8000/ospf/advanced/interface/1/
```
##### Section Area

Exp1: add options
```
$ curl -X POST -d 'id_instance=1&interface_area=1&nssa=no-summary&stub=false&stub_no_summery=false&&default_cost=20&auth=true&auth_message_digest=false&virtual_link='  http://localhost:8000/ospf/advanced/area/

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 10
 ip ospf hello-interval 3
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 10
 ip ospf transmit-delay 10
!
router ospf 1
 ospf router-id 5.5.5.5
 area 1 authentication
 area 1 nssa
 area 1 nssa no-summary
 area 1 default-cost 20
!
line vty
!
end
```
Exp2: update options
```
$ curl -X PUT -d 'id_instance=1&interface_area=1&nssa=no-summary&stub=&stub_no_summery=&&default_cost=&auth=false&auth_message_digest=false&virtual_link='  http://localhost:8000/ospf/advanced/area/1/
test# show running-config

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 10
 ip ospf hello-interval 3
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 10
 ip ospf transmit-delay 10
!
router ospf 1
 ospf router-id 5.5.5.5
 area 1 nssa
 area 1 default-cost 30
!
line vty
!
end

```
Exp3: Get information

```
$ curl -X GET http://localhost:8000/ospf/advanced/area/

$ curl -X GET http://localhost:8000/ospf/advanced/area/1/

{"id_instance":1,"interface_area":1,"nssa":"no-summary","stub":false,"stub_no_summery":false,"default_cost":20,"auth":false,"auth_message_digest":false,"virtual_link":null}

```
Exp4: Delete options
```
$ curl -X DELETE -d 'id_instance=1&interface_area=1&default_cost=30&virtual_link='  http://localhost:8000/ospf/advanced/area/1/

Hello, this is FRRouting (version 7.3.1-MyOwnFRRVersion-gfea8db7-dirty).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

This is a git build of fea8db7-dirty
Associated branch(es):
        local:develop
        https://gitlab.network.com/main/dynamic_routing.git/develop

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 10
 ip ospf hello-interval 3
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 10
 ip ospf transmit-delay 10
!
router ospf 1
 ospf router-id 5.5.5.5
!
line vty
!
end
test#
```
##### Section Global Parameters
Exp1: add options
```
$ curl -X POST -d 'id_instance=1&passive_interface=ens256&redistribute=connected&default_metric=10&timers_lsa_min_interval=20&timers_throttle_lsa_all=10&timers_throttle_spf_delay=30&timers_throttle_initial_hold_time=2&timers_throttle_max_hold_time=5&ospf_abr_type=standard&max_mertic_router_lsa_on_startup=6&max_mertic_router_lsa_on_shutdown=10&max_mertic_router_lsa_administrative=True&neighbor=1.2.3.3&neighbor_poll_interval=3&neighbor_poll_interval_priority=4&ospf_rfc1583compatibility=True&auto_cost_reference_bandwidth=100&distance=20&distance_ospf_inter_area=30&distance_ospf_intra_area=3&distance_ospf_external_area=40&default_info_originate=True&default_info_originate_always=True&default_info_metric=10&default_info_metric_type=1&default_info_route_map=test&log_adjacency_changes=True' http://localhost:8000/ospf/advanced/global/

{"id_instance":1,"passive_interface":"ens256","redistribute":"connected","default_metric":10,"timers_lsa_min_interval":20,"timers_throttle_lsa_all":10,"timers_throttle_spf_delay":30,"timers_throttle_spf_initial_hold_time":null,"timers_throttle_spf_max_hold_time":null,"ospf_abr_type":"standard","max_mertic_router_lsa_on_startup":6,"max_mertic_router_lsa_on_shutdown":10,"max_mertic_router_lsa_administrative":true,"neighbor":"1.2.3.3","neighbor_poll_interval":3,"neighbor_poll_interval_priority":4,"ospf_rfc1583compatibility":true,"auto_cost_reference_bandwidth":100,"distance":20,"distance_ospf_inter_area":30,"distance_ospf_intra_area":null,"distance_ospf_external_area":40,"default_info_originate":true,"default_info_originate_always":true,"default_info_metric":10,"default_info_metric_type":1,"default_info_route_map":"test","log_adjacency_changes":true}


Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 10
 ip ospf hello-interval 3
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 10
 ip ospf transmit-delay 10
!
router ospf 1
 ospf router-id 5.5.5.5
 ospf abr-type standard
 log-adjacency-changes
 compatible rfc1583
 auto-cost reference-bandwidth 100
 timers throttle spf 30 2 5
 timers lsa min-arrival 20
 max-metric router-lsa on-startup 6
 max-metric router-lsa on-shutdown 10
 max-metric router-lsa administrative
 redistribute connected
 passive-interface ens256
 area 1 nssa
 area 1 nssa no-summary
 area 1 default-cost 20
 neighbor 1.2.3.3 priority 4 poll-interval 3
 default-metric 10
 default-information originate route-map test
 distance 20
 distance ospf external 40
!
line vty
!
end
test#
```
Exp2: update options
```
$ curl -X PUT -d 'id_instance=1&passive_interface=ens192&redistribute=static&default_metric=&timers_lsa_min_interval=22&timers_throttle_lsa_all=14&timers_throttle_spf_delay=40&timers_throttle_initial_hold_time=&timers_throttle_max_hold_time=&ospf_abr_type=standard&max_mertic_router_lsa_on_startup=9&max_mertic_router_lsa_on_shutdown=&max_mertic_router_lsa_administrative=false&neighbor=&neighbor_poll_interval=4&neighbor_poll_interval_priority=6&ospf_rfc1583compatibility=false&auto_cost_reference_bandwidth=200&distance=25&distance_ospf_inter_area=32&distance_ospf_intra_area=5&distance_ospf_external_area=&default_info_originate=false&default_info_originate_always=false&default_info_metric=20&default_info_metric_type=1&default_info_route_map=test1&log_adjacency_changes=false' http://localhost:8000/ospf/advanced/global/1/

{"id_instance":1,"passive_interface":"ens192","redistribute":"static","default_metric":10,"timers_lsa_min_interval":22,"timers_throttle_lsa_all":14,"timers_throttle_spf_delay":40,"timers_throttle_spf_initial_hold_time":null,"timers_throttle_spf_max_hold_time":null,"ospf_abr_type":"standard","max_mertic_router_lsa_on_startup":9,"max_mertic_router_lsa_on_shutdown":10,"max_mertic_router_lsa_administrative":false,"neighbor":"1.2.3.3","neighbor_poll_interval":4,"neighbor_poll_interval_priority":6,"ospf_rfc1583compatibility":false,"auto_cost_reference_bandwidth":200,"distance":25,"distance_ospf_inter_area":32,"distance_ospf_intra_area":5,"distance_ospf_external_area":40,"default_info_originate":false,"default_info_originate_always":false,"default_info_metric":20,"default_info_metric_type":1,"default_info_route_map":"test1","log_adjacency_changes":false}

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 10
 ip ospf hello-interval 3
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 10
 ip ospf transmit-delay 10
!
router ospf 1
 ospf router-id 5.5.5.5
 ospf abr-type standard
 log-adjacency-changes
 compatible rfc1583
 auto-cost reference-bandwidth 200
 timers throttle spf 30 2 5
 timers lsa min-arrival 22
 max-metric router-lsa on-startup 9
 max-metric router-lsa on-shutdown 10
 max-metric router-lsa administrative
 redistribute connected
 redistribute static
 passive-interface ens192
 passive-interface ens224
 passive-interface ens256
 area 1 nssa
 area 1 nssa no-summary
 area 1 default-cost 20
 neighbor 1.2.3.3 priority 4 poll-interval 3
 default-metric 10
 default-information originate route-map test1
 distance 25
 distance ospf intra-area 5
!
line vty
!
end
test#
```
Exp3: Get information
```
 $ curl -X GET http://localhost:8000/ospf/advanced/global/

$ curl -X GET http://localhost:8000/ospf/advanced/global/1/

{"id_instance":1,"passive_interface":"ens192","redistribute":"static","default_metric":10,"timers_lsa_min_interval":22,"timers_throttle_lsa_all":14,"timers_throttle_spf_delay":40,"timers_throttle_spf_initial_hold_time":null,"timers_throttle_spf_max_hold_time":null,"ospf_abr_type":"standard","max_mertic_router_lsa_on_startup":9,"max_mertic_router_lsa_on_shutdown":10,"max_mertic_router_lsa_administrative":false,"neighbor":"1.2.3.3","neighbor_poll_interval":4,"neighbor_poll_interval_priority":6,"ospf_rfc1583compatibility":false,"auto_cost_reference_bandwidth":200,"distance":25,"distance_ospf_inter_area":32,"distance_ospf_intra_area":5,"distance_ospf_external_area":40,"default_info_originate":false,"default_info_originate_always":false,"default_info_metric":20,"default_info_metric_type":1,"default_info_route_map":"test1","log_adjacency_changes":false}o
```
Exp4: Delete inforamtion
```
curl -X DELETE -d 'id_instance=1&passive_interface=ens192&redistribute=static&ospf_abr_type=standard&neighbor=1.2.3.3&distance=25&default_info_metric=20&default_info_metric_type=1&default_info_route_map=test1' http://localhost:8000/ospf/advanced/global/1/

$sudo vtysh
 Current configuration:
Hello, this is FRRouting (version 7.3.1-MyOwnFRRVersion-gfea8db7-dirty).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

This is a git build of fea8db7-dirty
Associated branch(es):
        local:develop
        https://gitlab.network.com/main/dynamic_routing.git/develop

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
interface ens192
 ip ospf 1 area 1
 ip ospf authentication message-digest
 ip ospf authentication-key 123
 ip ospf cost 10
 ip ospf dead-interval 10
 ip ospf hello-interval 3
 ip ospf message-digest-key 1 md5 test
 ip ospf network non-broadcast
 ip ospf priority 20
 ip ospf retransmit-interval 10
 ip ospf transmit-delay 10
!
router ospf 1
 ospf router-id 5.5.5.5
!
line vty
!
end
```
[http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html]: http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html

[https://frrouting.readthedocs.io/en/latest/ospfd.html#multi-instance-support]: https://frrouting.readthedocs.io/en/latest/ospfd.html#multi-instance-support
