# Configuration,and Test Static

## Configuration
Static daemon must be enabled before testing. To do that, `staticd=yes` must be inserted into `/etc/frr/daemons` and then restart frr.
`Note:`\
Implemented parameters are referred to in https://docs.frrouting.org/en/latest/static.html. 
### Test Requests
Exp1: insert
```
$ curl -X POST -d 'ip_dst=3.3.3.3&ip_dst_prefix=24&gateway=4.4.4.4&interface_gateway=&null_interface=&distance=2&reject=' http://localhost:8000/staticroute/basic/

{"ip_dst":"3.3.3.3","ip_dst_prefix":24,"gateway":null,"interface_gateway":null,"null_interface":null,"distance":2,"reject":null}

$ curl -X POST -d 'ip_dst=4.4.4.4&ip_dst_prefix=25&gateway=&interface_gateway=ens192&null_interface=&distance=2&reject=' http://localhost:8000/staticroute/basic/

{"ip_dst":"4.4.4.4","ip_dst_prefix":25,"gateway":null,"interface_gateway":null,"null_interface":null,"distance":2,"reject":null}

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
ip route 3.3.3.0/24 4.4.4.4 2
ip route 4.4.4.0/25 ens192 2
!
line vty
!
end
test#
```
Exp2: update
```
Note:
Distance and reject and null0 fields could be updated.

$  curl -X PUT -d 'ip_dst=3.3.3.3&ip_dst_prefix=24&gateway=4.4.4.4&interface_gateway=&null_interface=&distance=5&reject=' http://localhost:8000/staticroute/basic/detail/1/
{"ip_dst":"3.3.3.3","ip_dst_prefix":24,"gateway":"4.4.4.4","interface_gateway":"ens192","null_interface":false,"distance":5,"reject":false}

$  curl -X PUT -d 'ip_dst=4.4.4.4&ip_dst_prefix=25&gateway=&interface_gateway=ens192&null_interface=&distance=6&reject=' http://localhost:8000/staticroute/basic/detail/2/
{"ip_dst":"4.4.4.4","ip_dst_prefix":25,"gateway":null,"interface_gateway":"ens192","null_interface":null,"distance":6,"reject":null}
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
ip route 3.3.3.0/24 4.4.4.4 5
ip route 4.4.4.0/25 ens192 6
!
line vty
!
end
test#
```
Exp3: Get Information
```
$  curl -X GET http://localhost:8000/staticroute/basic/

[{"ip_dst":"3.3.3.3","ip_dst_prefix":24,"gateway":"4.4.4.4","interface_gateway":"ens192","null_interface":false,"distance":5,"reject":false},{"ip_dst":"4.4.4.4","ip_dst_prefix":25,"gateway":null,"interface_gateway":"ens192","null_interface":null,"distance":6,"reject":null},{"ip_dst":"4.4.4.4","ip_dst_prefix":24,"gateway":null,"interface_gateway":null,"null_interface":true,"distance":null,"reject":null}]
 or
$  curl -X GET http://localhost:8000/staticroute/basic/detail/1/
```
exp4: Delete
```
Note:
reject and null fields should be equal False for removing.

$ curl -X DELETE -d 'ip_dst=3.3.3.3&ip_dst_prefix=24&gateway=4.4.4.4&interface_gateway=&null_interface=&reject=' http://localhost:8000/staticroute/basic/detail/1/

$ curl -X DELETE -d 'ip_dst=4.4.4.4&ip_dst_prefix=25&gateway=&interface_gateway=ens192&null_interface=&reject=' http://localhost:8000/staticroute/basic/detail/2/
```

