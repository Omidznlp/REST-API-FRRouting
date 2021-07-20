# Configuration,and Test BGP

## Configuration
BGP daemon must be enabled before testing. To do that, `bgpd=yes` must be inserted into `/etc/frr/daemons` and then restart frr \
`Note:`\
Some parameters can not be used together. Therefore,if they are configured together, one of them would be ignored when commands are inserted into Frr.
##Test
BGP are divided to three section:\
1.BGP Base  \
2.BGP Address Family \
3.BGP Global Parameters \
**Note** \
BGP Base must be configured before two next sections
### BGP Base

Exp1: Insert

**Note:** \
neighbor serves two types : it has ip address or it is connected to router interface. Therefore, one of them  can be chosen for configuration. In this test, ip address of neighbor is chosen.

```
$ curl -X POST -d 'as_number=1&router_id=3.3.3.3&neighbor_addr=1.1.1.1&neighbor_interface_name=&remote_as_num=2&remote_as_internal=&remote_as_external' http://localhost:8000/bgp/basic/

{"as_number":1,"router_id":"3.3.3.3","neighbor_addr":"1.1.1.1","update_neighbor_addr":null,"neighbor_interface_name":null,"remote_as_num":2,"remote_as_internal":null,"remote_as_external":null}

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
router bgp 1
 bgp router-id 3.3.3.3
 neighbor 1.1.1.1 remote-as 2
!
line vty
!
end
test(config)#
```
Exp2: Update
```
$ curl -X PUT -d 'as_number=1&router_id=4.4.4.4&neighbor_addr=1.1.1.1&&neighbor_interface_name=&&remote_as_num=3&remote_as_internal=&remote_as_external=' http://localhost:8000/bgp/basic/detail/1/

{"as_number":1,"router_id":"4.4.4.4","neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"remote_as_num":3,"remote_as_internal":null,"remote_as_external":null}

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
router bgp 1
 bgp router-id 4.4.4.4
 neighbor 1.1.1.1 remote-as 3
!
line vty
!
end
```
Exp3: Get Information
```
$ curl -X GET http://localhost:8000/bgp/basic/detail/1/

or

$ curl -X GET http://localhost:8000/bgp/basic/
```
Exp4: Delete
```
$ curl -X DELETE http://localhost:8000/bgp/basic/detail/1/
```

### BGP Address Family

Exp1: Insert
```
$ curl -X POST -d 'as_number=1&type_addr_family=&aggregate_address=3.3.3.3&aggregate_address_prefix=24&aggregate_address_as_set=True&aggregate_address_routemap=&aggregate_address_summery_only=&distance_admin=1&distance_admin_ip=4.4.4.4&distance_admin_prefix=24&distance_external_routes=4&distance_internal_routes=3&distance_local_routes=2&maximum_paths=5&maximum_paths_ibgp=2&network_addr=6.6.6.6&network_addr_prefix=25&network_route_map=test&redistribute=ospf&neighbor_addr=1.1.1.1&neighbor_interface_name=&neighbor_addpath_tx_all_paths=True&neighbor_addpath_tx_bestpath_per_as=&neighbor_allowas_in=&neighbor_allowas_in_origin=True&neighbor_as_override=True&neighbor_attribute_unchanged_all=&neighbor_attribute_unchanged_as_path=True&neighbor_attribute_unchanged_med=True&neighbor_attribute_unchanged_nexthop=&neighbor_default_originate=&neighbor_default_originate_routemap=test&neighbor_distribute_list_num=1&neighbor_distribute_list_expanded=&neighbor_distribute_list_in_out=in&neighbor_prefix_list=&neighbor_prefix_list_in_out=&neighbor_route_map=test&neighbor_route_map_in_out=out&neighbor_send_community=all' http://localhost:8000/bgp/addrfamily/

{"as_number":1,"type_addr_family":null,"aggregate_address":"3.3.3.3","aggregate_address_prefix":24,"aggregate_address_as_set":true,"aggregate_address_routemap":null,"aggregate_address_summery_only":null,"distance_admin":1,"distance_admin_ip":"4.4.4.4","distance_admin_prefix":24,"distance_external_routes":4,"distance_internal_routes":3,"distance_local_routes":2,"maximum_paths":5,"maximum_paths_ibgp":2,"network_addr":"6.6.6.6","network_addr_prefix":25,"network_route_map":"test","redistribute":"ospf","neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"neighbor_addpath_tx_all_paths":true,"neighbor_addpath_tx_bestpath_per_as":null,"neighbor_allowas_in":null,"neighbor_allowas_in_origin":true,"neighbor_as_override":true,"neighbor_attribute_unchanged_all":null,"neighbor_attribute_unchanged_as_path":true,"neighbor_attribute_unchanged_med":true,"neighbor_attribute_unchanged_nexthop":null,"neighbor_default_originate":null,"neighbor_default_originate_routemap":"test","neighbor_distribute_list_num":1,"neighbor_distribute_list_expanded":null,"neighbor_distribute_list_in_out":"in","neighbor_prefix_list":null,"neighbor_prefix_list_in_out":null,"neighbor_route_map":"test","neighbor_route_map_in_out":"out","neighbor_send_community":"all"}

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
router bgp 1
 bgp router-id 4.4.4.4
 neighbor 1.1.1.1 remote-as 3
 !
 address-family ipv4 unicast
  distance bgp 4 3 2
  distance 1 4.4.4.0/24
  network 6.6.6.0/25 route-map test
  aggregate-address 3.3.3.0/24 as-set
  redistribute ospf
  neighbor 1.1.1.1 addpath-tx-all-paths
  neighbor 1.1.1.1 as-override
  neighbor 1.1.1.1 default-originate route-map test
  neighbor 1.1.1.1 allowas-in origin
  neighbor 1.1.1.1 distribute-list 1 in
  neighbor 1.1.1.1 route-map test out
  neighbor 1.1.1.1 attribute-unchanged as-path med
  maximum-paths 5
  maximum-paths ibgp 2
 exit-address-family
!
line vty
!
end
```
Exp2: Update

```
$ curl -X PUT -d 'as_number=1&type_addr_family=&aggregate_address=3.3.3.3&aggregate_address_prefix=24&aggregate_address_as_set=False&aggregate_address_routemap=&aggregate_address_summery_only=True&distance_admin=2&distance_admin_ip=4.4.4.4&distance_admin_prefix=24&distance_external_routes=5&distance_internal_routes=6&distance_local_routes=7&maximum_paths=8&maximum_paths_ibgp=4&network_addr=6.6.6.6&network_addr_prefix=25&network_route_map=test_new&redistribute=&neighbor_addr=1.1.1.1&neighbor_interface_name=&neighbor_addpath_tx_all_paths=False&neighbor_addpath_tx_bestpath_per_as=True&neighbor_allowas_in=True&neighbor_allowas_in_origin=False&neighbor_as_override=&neighbor_attribute_unchanged_all=&neighbor_attribute_unchanged_as_path=False&neighbor_attribute_unchanged_med=False&neighbor_attribute_unchanged_nexthop=True&neighbor_default_originate=&neighbor_default_originate_routemap=test_new&neighbor_distribute_list_num=1&neighbor_distribute_list_expanded=&neighbor_distribute_list_in_out=out&neighbor_prefix_list=&neighbor_prefix_list_in_out=&neighbor_route_map=new_test&neighbor_route_map_in_out=in&neighbor_send_community=both' http://localhost:8000/bgp/addrfamily/detail/1/

{"as_number":1,"type_addr_family":null,"aggregate_address":"3.3.3.3","aggregate_address_prefix":24,"aggregate_address_as_set":false,"aggregate_address_routemap":null,"aggregate_address_summery_only":true,"distance_admin":2,"distance_admin_ip":"4.4.4.4","distance_admin_prefix":24,"distance_external_routes":5,"distance_internal_routes":6,"distance_local_routes":7,"maximum_paths":8,"maximum_paths_ibgp":4,"network_addr":"6.6.6.6","network_addr_prefix":25,"network_route_map":"test_new","redistribute":"ospf","neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"neighbor_addpath_tx_all_paths":false,"neighbor_addpath_tx_bestpath_per_as":true,"neighbor_allowas_in":true,"neighbor_allowas_in_origin":false,"neighbor_as_override":true,"neighbor_attribute_unchanged_all":null,"neighbor_attribute_unchanged_as_path":false,"neighbor_attribute_unchanged_med":false,"neighbor_attribute_unchanged_nexthop":true,"neighbor_default_originate":null,"neighbor_default_originate_routemap":"test_new","neighbor_distribute_list_num":1,"neighbor_distribute_list_expanded":null,"neighbor_distribute_list_in_out":"out","neighbor_prefix_list":null,"neighbor_prefix_list_in_out":null,"neighbor_route_map":"new_test","neighbor_route_map_in_out":"in","neighbor_send_community":"both"}

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
router bgp 1
 bgp router-id 4.4.4.4
 neighbor 1.1.1.1 remote-as 3
 !
 address-family ipv4 unicast
  distance bgp 5 6 7
  distance 2 4.4.4.0/24
  network 6.6.6.0/25 route-map test_new
  aggregate-address 3.3.3.0/24 summary-only
  redistribute ospf
  neighbor 1.1.1.1 addpath-tx-bestpath-per-AS
  neighbor 1.1.1.1 as-override
  neighbor 1.1.1.1 default-originate route-map test_new
  neighbor 1.1.1.1 allowas-in
  neighbor 1.1.1.1 distribute-list 1 in
  neighbor 1.1.1.1 distribute-list 1 out
  neighbor 1.1.1.1 route-map new_test in
  neighbor 1.1.1.1 route-map test out
  neighbor 1.1.1.1 attribute-unchanged next-hop
  maximum-paths 8
  maximum-paths ibgp 4
 exit-address-family
!
line vty
!
end

```
Exp3: Get Information
```
$ curl -X GET http://localhost:8000/bgp/addrfamily/

[{"as_number":1,"type_addr_family":null,"aggregate_address":"3.3.3.3","aggregate_address_prefix":24,"aggregate_address_as_set":false,"aggregate_address_routemap":null,"aggregate_address_summery_only":true,"distance_admin":2,"distance_admin_ip":"4.4.4.4","distance_admin_prefix":24,"distance_external_routes":5,"distance_internal_routes":6,"distance_local_routes":7,"maximum_paths":8,"maximum_paths_ibgp":4,"network_addr":"6.6.6.6","network_addr_prefix":25,"network_route_map":"test_new","redistribute":"ospf","neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"neighbor_addpath_tx_all_paths":false,"neighbor_addpath_tx_bestpath_per_as":true,"neighbor_allowas_in":true,"neighbor_allowas_in_origin":false,"neighbor_as_override":true,"neighbor_attribute_unchanged_all":null,"neighbor_attribute_unchanged_as_path":false,"neighbor_attribute_unchanged_med":false,"neighbor_attribute_unchanged_nexthop":true,"neighbor_default_originate":null,"neighbor_default_originate_routemap":"test_new","neighbor_distribute_list_num":1,"neighbor_distribute_list_expanded":null,"neighbor_distribute_list_in_out":"out","neighbor_prefix_list":null,"neighbor_prefix_list_in_out":null,"neighbor_route_map":"new_test","neighbor_route_map_in_out":"in","neighbor_send_community":"both"}]

or

$ curl -X GET http://localhost:8000/bgp/addrfamily/detail/1/
```
Exp4: Delete
```
 curl -X DELETE -d 'as_number=1&type_addr_family=&aggregate_address=3.3.3.3&aggregate_address_prefix=24&distance_admin=2&distance_admin_ip=4.4.4.4&distance_admin_prefix=24&network_addr=6.6.6.6&network_addr_prefix=25&redistribute=ospf&neighbor_addr=1.1.1.1&neighbor_interface_name=' http://localhost:8000/bgp/addrfamily/detail/1/
```

### BGP Global Parameters

Exp1: Insert
```
$ curl -X POST -d 'as_number=1&neighbor_addr=1.1.1.1&neighbor_interface_name=&neighbor_update_source_addr=2.2.2.2&neighbor_update_source_interface_name=&neighbor_ebgp_multihop=&neighbor_ebgp_multihop_numhop=2&neighbor_shutdown=True&neighbor_keepalive=20&neighbor_holdtime=30&neighbor_connect_timer=18&neighbor_password=testing&neighbor_passive=True&neighbor_ttl_security=2&timer_keepalive=20&timer_holdtime=30&update_delay=20' http://localhost:8000/bgp/global/

{"as_number":1,"neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"neighbor_update_source_addr":"2.2.2.2","neighbor_update_source_interface_name":null,"neighbor_ebgp_multihop":null,"neighbor_ebgp_multihop_numhop":2,"neighbor_shutdown":true,"neighbor_keepalive":20,"neighbor_holdtime":30,"neighbor_connect_timer":18,"neighbor_password":"testing","neighbor_passive":true,"neighbor_ttl_security":2,"timer_keepalive":20,"timer_holdtime":30,"update_delay":20}
rsion 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
service integrated-vtysh-config
!
router bgp 1
 update-delay 20
 timers bgp 10 30
 neighbor 1.1.1.1 remote-as 1
 neighbor 1.1.1.1 shutdown
 neighbor 1.1.1.1 password testing
 neighbor 1.1.1.1 passive
 neighbor 1.1.1.1 ttl-security hops 2
 neighbor 1.1.1.1 update-source 2.2.2.2
 neighbor 1.1.1.1 timers 10 30
 neighbor 1.1.1.1 timers connect 18
line vty
!
end
test(config-router)#

```
Exp2: Update
```
$ curl -X PUT -d 'as_number=1&neighbor_addr=1.1.1.1&neighbor_interface_name=&neighbor_update_source_addr=3.3.3.3&neighbor_update_source_interface_name=&neighbor_ebgp_multihop=&neighbor_ebgp_multihop_numhop=3&neighbor_shutdown=False&neighbor_keepalive=30&neighbor_holdtime=50&neighbor_connect_timer=25&neighbor_password=new_pass&neighbor_passive=False&neighbor_ttl_security=10&timer_keepalive=30&timer_holdtime=70&update_delay=50' http://localhost:8000/bgp/global/detail/1/

{"as_number":1,"neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"neighbor_update_source_addr":"3.3.3.3","neighbor_update_source_interface_name":null,"neighbor_ebgp_multihop":null,"neighbor_ebgp_multihop_numhop":3,"neighbor_shutdown":false,"neighbor_keepalive":30,"neighbor_holdtime":50,"neighbor_connect_timer":25,"neighbor_password":"new_pass","neighbor_passive":false,"neighbor_ttl_security":10,"timer_keepalive":30,"timer_holdtime":70,"update_delay":50}
```
Exp3: Get information
```
$ curl -X GET http://localhost:8000/bgp/global/detail/1/

{"as_number":1,"neighbor_addr":"1.1.1.1","neighbor_interface_name":null,"neighbor_update_source_addr":"3.3.3.3","neighbor_update_source_interface_name":null,"neighbor_ebgp_multihop":null,"neighbor_ebgp_multihop_numhop":3,"neighbor_shutdown":false,"neighbor_keepalive":30,"neighbor_holdtime":50,"neighbor_connect_timer":25,"neighbor_password":"new_pass","neighbor_passive":false,"neighbor_ttl_security":10,"timer_keepalive":30,"timer_holdtime":70,"update_delay":50}

or

$ curl -X GET http://localhost:8000/bgp/global/
```
Exp4: DELETE
```
$ curl -X DELETE -d 'as_number=1&neighbor_addr=1.1.1.1&neighbor_interface_name=&neighbor_ttl_security=10' http://localhost:8000/bgp/global/detail/1/
```
