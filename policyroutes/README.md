# Configuration,and Test Policy Routes

## Configuration
PBR daemon must be enabled before testing. To do that, `pbrd=yes` must be inserted into `/etc/frr/daemons` and then restart frr \
`Note:`\
`Note:`\
Implemented parameters are referred to https://docs.frrouting.org/en/latest/pbr.html ,\
https://docs.frrouting.org/en/latest/filter.html , \
https://docs.frrouting.org/en/latest/routemap.html  
Please note that some parameters should not be configured together. To address, if they are configured, one of them would be ignored when commands are inserted into Frr 
##Test
Policy routes are divided to four section:\
1.Policy Based Routing \
2.Access List \
3.Prefix List \
4.Route Map

###Policy Based Routing

Exp1 : Insert
```
$ curl -X POST -d 'nexthop_group_name=test&nexthop_ip=1.1.1.1&nexthop_interface=ens192&label=16&map_name=test1&map_seq=1&match_src_ip=2.2.2.2&mask_src_ip=24&match_dst_ip=3.3.3.3&mask_dst_ip=30&match_mark=10&mark=1&set_nexthop_group_name=test&set_nexthop_ip=4.4.4.4&set_nexthop_interface=ens256&apply_pbr_interface=ens224' http://localhost:8000/policyroutes/pbr/

{"nexthop_group_name":"test","nexthop_ip":"1.1.1.1","update_nexthop_ip":null,"nexthop_interface":"ens192","update_nexthop_interface":null,"label":16,"update_label":null,"map_name":"test1","map_seq":1,"match_src_ip":"2.2.2.2","mask_src_ip":24,"update_match_src_ip":null,"update_mask_src_ip":null,"match_dst_ip":"3.3.3.3","mask_dst_ip":30,"update_match_dst_ip":null,"update_mask_dst_ip":null,"match_mark":10,"update_match_mark":null,"set_nexthop_group_name":"test","set_nexthop_ip":"4.4.4.4","update_set_nexthop_ip":null,"set_nexthop_interface":"ens256","update_set_nexthop_interface":null,"apply_pbr_interface":"ens224","update_apply_pbr_interface":null}

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
pbr table range 10000 20000
service integrated-vtysh-config
!
interface ens224
 pbr-policy test1
!
nexthop-group test
 nexthop 1.1.1.1
 nexthop ens192 label 16
!
pbr-map test1 seq 1
 match src-ip 2.2.2.2/24
 match dst-ip 3.3.3.3/30
 match mark 10
 set nexthop-group test
!
line vty
!
end
test#
```
Exp2 : Update
```
Updating fields are not supported by Frrouting by now. Therefore, fields must be removed,if they have to be replaced by new ones.
```
Exp3: Get Information
```
$ curl -X GET http://localhost:8000/policyroutes/pbr/


or

$ curl -X GET http://localhost:8000/policyroutes/pbr/detail/1/

```
Exp4: Delete
```
$  curl -X DELETE -d 'nexthop_group_name=test&map_name=test1&map_seq=1&apply_pbr_interface=ens224' http://localhost:8000/policyroutes/pbr/detail/1/

```
##Access List
Exp1: Insert
```
####### Standard Access List #######

$ curl -X POST -d 'seq=1&range_standard_first=1&range_standard_second=&range_expanded_first=&range_expanded_second=&action=deny&ip_st_ex=3.3.3.3&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":1,"range_standard_first":1,"range_standard_second":null,"range_expanded_first":null,"range_expanded_second":null,"action":"deny","ip_st_ex":"3.3.3.3","prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$ curl -X POST -d 'seq=2&range_standard_first=2&range_standard_second=&range_expanded_first=&range_expanded_second=&action=deny&ip_st_ex=4.4.4.4&prefix_st_ex=24&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":2,"range_standard_first":2,"range_standard_second":null,"range_expanded_first":null,"range_expanded_second":null,"action":"deny","ip_st_ex":"4.4.4.4","prefix_st_ex":24,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$ curl -X POST -d 'seq=3&range_standard_first=&range_standard_second=1300&range_expanded_first=&range_expanded_second=&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=True&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":3,"range_standard_first":null,"range_standard_second":1300,"range_expanded_first":null,"range_expanded_second":null,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":true,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$ curl -X POST -d 'seq=4&range_standard_first=&range_standard_second=1301&range_expanded_first=&range_expanded_second=&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=6.6.6.6&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":4,"range_standard_first":null,"range_standard_second":1301,"range_expanded_first":null,"range_expanded_second":null,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":true,"host_st":"6.6.6.6","ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

test# do show running-config
Building configuration...

Current configuration:
!
frr version 7.3.1-MyOwnFRRVersion
frr defaults traditional
hostname test
log syslog informational
no ip forwarding
no ipv6 forwarding
pbr table range 10000 20000
service integrated-vtysh-config
!
access-list 1 seq 1 deny 3.3.3.3
access-list 1300 seq 3 permit any
access-list 1301 seq 4 permit 6.6.6.6
access-list 2 seq 2 deny 4.4.4.4/24
!
line vty
!
end
test(config)#

####### Expanded Access List #######

$ curl -X POST -d 'seq=5&range_standard_first=&range_standard_second=&range_expanded_first=100&range_expanded_second=&action=permit&ip_st_ex=7.7.7.7&prefix_st_ex=24&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":5,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":100,"range_expanded_second":null,"action":"permit","ip_st_ex":"7.7.7.7","prefix_st_ex":24,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$  curl -X POST -d 'seq=6&range_standard_first=&range_standard_second=&range_expanded_first=101&range_expanded_second=&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=True&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":6,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":101,"range_expanded_second":null,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":true,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$ curl -X POST -d 'seq=7&range_standard_first=&range_standard_second=&range_expanded_first=102&range_expanded_second=&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=9.9.9.9&ip_src_wildcard_ex=255.255.255.0&ip_dst_ex=10.10.10.10&ip_dst_wildcard_ex=255.255.0.0&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":7,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":102,"range_expanded_second":null,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":"9.9.9.9","ip_src_wildcard_ex":"255.255.255.0","ip_dst_ex":"10.10.10.10","ip_dst_wildcard_ex":"255.255.0.0","ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$  curl -X POST -d 'seq=8&range_standard_first=&range_standard_second=&range_expanded_first=103&range_expanded_second=&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=9.9.9.9&ip_src_wildcard_ex=255.255.255.0&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=True&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":8,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":103,"range_expanded_second":null,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":"9.9.9.9","ip_src_wildcard_ex":"255.255.255.0","ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":true,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$ curl -X POST -d 'seq=9&range_standard_first=&range_standard_second=&range_expanded_first=104&range_expanded_second=&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=True&ip_any_dst_ex=True&ip_host_src_ex=&ip_host_dst_ex' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":9,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":104,"range_expanded_second":null,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":true,"ip_any_dst_ex":true,"ip_host_src_ex":null,"ip_host_dst_ex":null}

$  curl -X POST -d 'seq=10&range_standard_first=&range_standard_second=&range_expanded_first=&range_expanded_second=2000&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=True&ip_any_dst_ex=&ip_host_src_ex=&ip_host_dst_ex=11.11.11.0' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":10,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":null,"range_expanded_second":2000,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":true,"ip_any_dst_ex":null,"ip_host_src_ex":null,"ip_host_dst_ex":"11.11.11.0"}

$ curl -X POST -d 'seq=11&range_standard_first=&range_standard_second=&range_expanded_first=&range_expanded_second=2001&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=12.12.12.1&ip_host_dst_ex=13.13.13.3' http://localhost:8000/policyroutes/routemap/accesslist/

{"seq":11,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":null,"range_expanded_second":2001,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":"12.12.12.1","ip_host_dst_ex":"13.13.13.0"}

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
pbr table range 10000 20000
service integrated-vtysh-config
!
access-list 1 seq 1 deny 3.3.3.3
access-list 100 seq 5 permit 7.7.7.7/24
access-list 101 seq 6 permit any
access-list 102 seq 7 permit ip 0.0.0.9 255.255.255.0 0.0.10.10 255.255.0.0
access-list 103 seq 8 permit ip 0.0.0.9 255.255.255.0 any
access-list 104 seq 9 permit ip any any
access-list 1300 seq 3 permit any
access-list 1301 seq 4 permit 6.6.6.6
access-list 2 seq 2 deny 4.4.4.4/24
access-list 2000 seq 10 permit ip any host 11.11.11.0
access-list 2001 seq 11 permit ip host 12.12.12.1 host 13.13.13.1
!
line vty
!
end
test#
```
Exp2: Update
```
$  curl -X PUT -d 'seq=11&range_standard_first=&range_standard_second=&range_expanded_first=&range_expanded_second=2001&action=permit&ip_st_ex=&prefix_st_ex=&any_all_st_ex=&host_st=&ip_src_ex=&ip_src_wildcard_ex=&ip_dst_ex=&ip_dst_wildcard_ex=&ip_any_src_ex=&ip_any_dst_ex=&ip_host_src_ex=16.16.16.1&ip_host_dst_ex=15.15.15.2' http://localhost:8000/policyroutes/routemap/accesslist/detail/11/

{"seq":11,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":null,"range_expanded_second":2001,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":"16.16.16.1","ip_host_dst_ex":"15.15.15.2"}

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
pbr table range 10000 20000
service integrated-vtysh-config
!
access-list 1 seq 1 deny 3.3.3.3
access-list 100 seq 5 permit 7.7.7.7/24
access-list 101 seq 6 permit any
access-list 102 seq 7 permit ip 0.0.0.9 255.255.255.0 0.0.10.10 255.255.0.0
access-list 103 seq 8 permit ip 0.0.0.9 255.255.255.0 any
access-list 104 seq 9 permit ip any any
access-list 1300 seq 3 permit any
access-list 1301 seq 4 permit 6.6.6.6
access-list 2 seq 2 deny 4.4.4.4/24
access-list 2000 seq 10 permit ip any host 11.11.11.0
access-list 2001 seq 11 permit ip host 16.16.16.1 host 15.15.15.2
!
line vty
!
end
test#
```
Exp3: Get Information
```
$ curl -X GET http://localhost:8000/policyroutes/routemap/accesslist/detail/11/

{"seq":11,"range_standard_first":null,"range_standard_second":null,"range_expanded_first":null,"range_expanded_second":2001,"action":"permit","ip_st_ex":null,"prefix_st_ex":null,"any_all_st_ex":null,"host_st":null,"ip_src_ex":null,"ip_src_wildcard_ex":null,"ip_dst_ex":null,"ip_dst_wildcard_ex":null,"ip_any_src_ex":null,"ip_any_dst_ex":null,"ip_host_src_ex":"16.16.16.1","ip_host_dst_ex":"15.15.15.2"}

$ curl -X GET http://localhost:8000/policyroutes/routemap/accesslist/

```
Exp4: Delete
```
$ curl -X DELETE -d 'range_standard_first=&range_standard_second=&range_expanded_first=&range_expanded_second=2001' http://localhost:8000/policyroutes/routemap/accesslist/detail/11/
```
## Prefix List
Exp1: Insert
```
$ curl -X POST -d 'seq=1&name=test&action=deny&ip=1.1.1.0&prefix=24&le=25&ge=25' http://localhost:8000/policyroutes/routemap/prefixlist/

{"name":"test","seq":1,"action":"deny","ip":"1.1.1.0","prefix":24,"le":25,"ge":25}

$ curl -X POST -d 'seq=2&name=test1&action=permit&ip=2.2.2.0&prefix=26&le=&ge=' http://localhost:8000/policyroutes/routemap/prefixlist/

{"name":"test1","seq":2,"action":"permit","ip":"2.2.2.0","prefix":26,"le":null,"ge":null}

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
!
ip prefix-list test seq 1 deny 1.1.1.0/24 ge 25 le 25
ip prefix-list test1 seq 2 permit 2.2.2.0/26
!
line vty
!
end
test#

```
Exp2: Update
```
$ curl -X PUT -d 'seq=1&name=test&action=permit&ip=1.1.1.0&prefix=24&le=26&ge=26' http://localhost:8000/policyroutes/routemap/prefixlist/detail/1/

{"name":"test","seq":1,"action":"permit","ip":"1.1.1.0","prefix":24,"le":26,"ge":26}

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
ip prefix-list test seq 1 permit 1.1.1.0/24 ge 26 le 26
ip prefix-list test1 seq 2 permit 2.2.2.0/26
!
line vty
!
end
test#
```
Exp4: Get Information
```
$ curl -X GET http://localhost:8000/policyroutes/routemap/prefixlist/

[{"name":"test","seq":1,"action":"permit","ip":"1.1.1.0","prefix":24,"le":26,"ge":26},{"name":"test1","seq":2,"action":"permit","ip":"2.2.2.0","prefix":26,"le":null,"ge":null}]

$ curl -X GET http://localhost:8000/policyroutes/routemap/prefixlist/detail/1/

{"name":"test","seq":1,"action":"permit","ip":"1.1.1.0","prefix":24,"le":26,"ge":26}
```
Exp4: Delete
```
curl -X DELETE -d 'seq=1&name=test' http://localhost:8000/policyroutes/routemap/prefixlist/detail/1/
```
##Route Map

Exp1: Insert

```
$ curl -X POST -d 'seq=1&name=test&action=permit&match_accesslist_num=1&match_accesslist_expanded=&match_prefix_len=24&match_prefix_list=test1&match_nexthop_accesslist_num=&match_nexthop_accesslist_expanded=1301&match_nexthop_prefix_len=25&match_nexthop_prefix_list=test2&match_as_path=testing123&match_community_name=bgp_com&match_community_standard=&match_community_expanded=500&match_metric=1&match_tag=16&match_local_preference=2&match_peer_ip=1.1.1.2&match_peer_interface=ens192&match_source_protocol=bgp&match_source_instance=2&match_origin=egp&set_tag=1&set_ip_nexthop=3.3.3.3&set_nexthop_peer_addr_bgp=True&set_nexthop_unchanged=&set_local_preference=18&set_local_preference_add=19&set_local_preference_sub=&set_distance=20&set_as_path_bgp_exclude=2&set_as_path_bgp_prepend=&set_community_name=local-AS&set_metric=20&set_origin=egp&set_aggregator_num=20&set_aggregator_ip=2.2.2.2&call=hello&continue_seq=6' http://localhost:8000/policyroutes/routemap/

{"seq":1,"name":"test","action":"permit","match_accesslist_num":1,"match_accesslist_expanded":null,"match_prefix_len":24,"match_prefix_list":"test1","match_nexthop_accesslist_num":null,"match_nexthop_accesslist_expanded":1301,"match_nexthop_prefix_len":25,"match_nexthop_prefix_list":"test2","match_as_path":"testing123","match_community_name":"bgp_com","match_community_standard":null,"match_community_expanded":500,"match_metric":1,"match_tag":"16","match_local_preference":2,"match_peer_ip":"1.1.1.2","match_peer_interface":"ens192","match_source_protocol":"bgp","match_source_instance":2,"match_origin":"egp","set_tag":1,"set_ip_nexthop":"3.3.3.3","set_nexthop_peer_addr_bgp":true,"set_nexthop_unchanged":null,"set_local_preference":18,"set_local_preference_add":19,"set_local_preference_sub":null,"set_distance":20,"set_as_path_bgp_exclude":2,"set_as_path_bgp_prepend":null,"set_community_name":"local-AS","set_metric":20,"set_origin":"egp","set_aggregator_num":20,"set_aggregator_ip":"2.2.2.2","call":"hello","continue_seq":6}

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
route-map test permit 1
 call hello
 match as-path testing123
 match community 500
 match ip address 1
 match ip address prefix-len 24
 match ip address prefix-list test1
 match ip next-hop 1301
 match ip next-hop prefix-len 25
 match ip next-hop prefix-list test2
 match local-preference 2
 match metric 1
 match origin egp
 match peer ens192
 match source-instance 2
 match source-protocol bgp
 match tag 16
 on-match goto 6
 set aggregator as 20 2.2.2.2
 set as-path exclude 2
 set community local-AS
 set distance 20
 set ip next-hop 3.3.3.3
 set ip next-hop peer-address
 set local-preference +19
 set metric 20
 set origin egp
 set tag 1
!
line vty
!
end

```
Exp2: Update
```
$ curl -X PUT -d 'seq=1&name=test&action=permit&match_accesslist_num=5&match_accesslist_expanded=&match_prefix_len=25&match_prefix_list=test5&match_nexthop_accesslist_num=&match_nexthop_accesslist_expanded=1303&match_nexthop_prefix_len=28&match_nexthop_prefix_list=&match_as_path=&match_community_name=bgp_com_new&match_community_standard=&match_community_expanded=&match_metric=2&match_tag=&match_local_preference=4&match_peer_ip=&match_peer_interface=&match_source_protocol=&match_source_instance=&match_origin=&set_tag=2&set_ip_nexthop=4.4.4.4&set_nexthop_peer_addr_bgp=&set_nexthop_unchanged=&set_local_preference=18&set_local_preference_add=&set_local_preference_sub=&set_distance=30&set_as_path_bgp_exclude=2&set_as_path_bgp_prepend=&set_community_name=&set_metric=30&set_origin=&set_aggregator_num=&set_aggregator_ip=&call=hello1&continue_seq=8' http://localhost:8000/policyroutes/routemap/detail/1/

{"seq":1,"name":"test","action":"permit","match_accesslist_num":5,"match_accesslist_expanded":null,"match_prefix_len":25,"match_prefix_list":"test5","match_nexthop_accesslist_num":null,"match_nexthop_accesslist_expanded":1303,"match_nexthop_prefix_len":28,"match_nexthop_prefix_list":"test2","match_as_path":"testing123","match_community_name":"bgp_com_new","match_community_standard":null,"match_community_expanded":500,"match_metric":2,"match_tag":"16","match_local_preference":4,"match_peer_ip":"1.1.1.2","match_peer_interface":"ens192","match_source_protocol":"bgp","match_source_instance":2,"match_origin":"egp","set_tag":2,"set_ip_nexthop":"4.4.4.4","set_nexthop_peer_addr_bgp":true,"set_nexthop_unchanged":null,"set_local_preference":18,"set_local_preference_add":19,"set_local_preference_sub":null,"set_distance":30,"set_as_path_bgp_exclude":2,"set_as_path_bgp_prepend":null,"set_community_name":"local-AS","set_metric":30,"set_origin":"egp","set_aggregator_num":20,"set_aggregator_ip":"2.2.2.2","call":"hello1","continue_seq":8}

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
route-map test permit 1
 call hello1
 match as-path testing123
 match community bgp_com_new
 match ip address 5
 match ip address prefix-len 25
 match ip address prefix-list test5
 match ip next-hop 1303
 match ip next-hop prefix-len 28
 match ip next-hop prefix-list test2
 match local-preference 4
 match metric 2
 match origin egp
 match peer ens192
 match source-instance 2
 match source-protocol bgp
 match tag 16
 on-match goto 8
 set aggregator as 20 2.2.2.2
 set as-path exclude 2
 set community local-AS
 set distance 30
 set ip next-hop 4.4.4.4
 set local-preference 18
 set metric 30
 set origin egp
 set tag 2
!
line vty
!
end
test#
```
Exp3: get Information
```
$ curl -X GET http://localhost:8000/policyroutes/routemap/detail/1/

{"seq":1,"name":"test","action":"permit","match_accesslist_num":5,"match_accesslist_expanded":null,"match_prefix_len":25,"match_prefix_list":"test5","match_nexthop_accesslist_num":null,"match_nexthop_accesslist_expanded":1303,"match_nexthop_prefix_len":28,"match_nexthop_prefix_list":"test2","match_as_path":"testing123","match_community_name":"bgp_com_new","match_community_standard":null,"match_community_expanded":500,"match_metric":2,"match_tag":"16","match_local_preference":4,"match_peer_ip":"1.1.1.2","match_peer_interface":"ens192","match_source_protocol":"bgp","match_source_instance":2,"match_origin":"egp","set_tag":2,"set_ip_nexthop":"4.4.4.4","set_nexthop_peer_addr_bgp":true,"set_nexthop_unchanged":null,"set_local_preference":18,"set_local_preference_add":19,"set_local_preference_sub":null,"set_distance":30,"set_as_path_bgp_exclude":2,"set_as_path_bgp_prepend":null,"set_community_name":"local-AS","set_metric":30,"set_origin":"egp","set_aggregator_num":20,"set_aggregator_ip":"2.2.2.2","call":"hello1","continue_seq":8}

$ curl -X GET http://localhost:8000/policyroutes/routemap/
```
Exp4: Delete
```
curl -X DELETE -d 'name=test' http://localhost:8000/policyroutes/routemap/detail/1/
```
