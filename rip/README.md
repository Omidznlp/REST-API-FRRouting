# Configuration,and Test RIP

## Configuration
RIP daemon must be enabled before testing. To do that, `ripd=yes` must be inserted into `/etc/frr/daemons` and then restart frr \
### Test Requests

**Description:**\

Base urls in this project are based on two types : \
`1.http://localhost:8000/rip/Basic/ `\
`2.http://localhost:8000/rip/advanced/` \
`/basic` must be configured to run rip instances \
`/advanced` is optional \
**Note:**\
All requests insert some commands into `Frrouting`. Moreover, We had better to make sure which it is inserted into Frrouting. To address, We can check result of requests by following "show running-config" command into Frrouting
to approve functionally of REST API

#### Basic Commands Section
Exp1: Insert
```
$ curl -X POST -d 'network_addr=1.1.1.1&network_prefix=24&network_interface_name=ens192&version=1' http://localhost:8000/rip/basic/

{"network_addr":"1.1.1.1","network_prefix":24,"network_interface_name":"ens192","version":1}

test# show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
service integrated-vtysh-config
!
router rip
 network 1.1.1.1/24
 network ens192
 version 1
!
line vty
!
end
test#
```
Exp2: Update
```
curl -X PUT -d 'version=2' http://localhost:8000/rip/basic/detail/1/

{"network_addr":"1.1.1.1","network_prefix":24,"network_interface_name":"ens192","version":2}

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
router rip
 network 1.1.1.1/24
 network ens192
 version 2
!
line vty
!
end
test#


```
Exp3: Get Information
```
$ curl -X GET http://localhost:8000/rip/basic/detail/1/

{"network_addr":"1.1.1.1","network_prefix":24,"network_interface_name":"ens192","version":2}

or

$ curl -X GET http://localhost:8000/rip/basic/
```
Exp4: Delete
```
curl -X DELETE http://localhost:8000/rip/basic/
```
###Advanced Commands Section

Exp1: Insert

```
$ curl -X POST -d 'neighbor=2.2.2.2&passive_interface=ens160&allow_ecmp=True&default_info_originate=True&redistribute=ospf&default_metric=3&distance=10&distribute_list_perfix_in_out=in&timers_update_time=10&timers_time_out=20&timers_garbage_time=30&interface_name=ens192&interface_auth_key_chain=test&interface_auth_string=&interface_auth_mode_md5=True&interface_auth_mode_text=&interface_receive_version=1&interface_send_version=1' http://localhost:8000/rip/advanced/

{"neighbor":"2.2.2.2","passive_interface":"ens160","allow_ecmp":true,"default_info_originate":true,"redistribute":"ospf","default_metric":3,"distance":10,"distribute_list_perfix_in_out":"in","timers_update_time":10,"timers_time_out":20,"timers_garbage_time":30,"interface_name":"ens192","interface_auth_key_chain":"test","interface_auth_mode_md5":"True","interface_auth_mode_text":null,"interface_receive_version":"1","interface_send_version":"1"}

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
 ip rip authentication key-chain test
 ip rip authentication mode md5
 ip rip receive version 1
 ip rip send version 1
!
router rip
 allow-ecmp
 default-information originate
 default-metric 3
 distance 10
 neighbor 2.2.2.2
 passive-interface ens160
 redistribute ospf
 timers basic 10 20 30
 distribute-list prefix in
!
line vty
!
end
test#

```
Exp2: Update

```
$ curl -X PUT -d 'allow_ecmp=False&default_info_originate=False&default_metric=5&distance=20&distribute_list_perfix_in_out=out&timers_update_time=30&timers_time_out=40&timers_garbage_time=60&interface_name=ens192&interface_auth_key_chain=test_new&interface_auth_string=&interface_auth_mode_md5=False&interface_auth_mode_text=True&interface_receive_version=2&interface_send_version=2' http://localhost:8000/rip/advanced/detail/1/

{"neighbor":"2.2.2.2","passive_interface":"ens160","allow_ecmp":false,"default_info_originate":false,"redistribute":"ospf","default_metric":5,"distance":20,"distribute_list_perfix_in_out":"out","timers_update_time":30,"timers_time_out":40,"timers_garbage_time":60,"interface_name":"ens192","interface_auth_key_chain":"test_new","interface_auth_mode_md5":"False","interface_auth_mode_text":"True","interface_receive_version":"2","interface_send_version":"2"}

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
 ip rip authentication key-chain test_new
 ip rip authentication mode text
 ip rip receive version 2
 ip rip send version 2
!
router rip
 default-metric 5
 distance 20
 neighbor 2.2.2.2
 passive-interface ens160
 redistribute ospf
 timers basic 30 40 60
 distribute-list prefix in
!
line vty
!
end
test#
```
Exp3: Get Information
```
$ curl -X GET http://localhost:8000/rip/advanced/detail/1/

{"neighbor":"2.2.2.2","passive_interface":"ens160","allow_ecmp":false,"default_info_originate":false,"redistribute":"ospf","default_metric":5,"distance":20,"distribute_list_perfix_in_out":"out","timers_update_time":30,"timers_time_out":40,"timers_garbage_time":60,"interface_name":"ens192","interface_auth_key_chain":"test_new","interface_auth_mode_md5":"False","interface_auth_mode_text":"True","interface_receive_version":"2","interface_send_version":"2"}

or

$ curl -X GET http://localhost:8000/rip/advanced/
```
Exp4: Delete
```
$ curl -X DELETE -d 'neighbor=2.2.2.2&passive_interface=ens160&distribute_list_perfix_in_out=in&interface_name=ens192' http://localhost:8000/rip/advanced/detail/1/
```
