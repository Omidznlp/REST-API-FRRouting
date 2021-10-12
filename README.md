
# Configuration, Installation,  RUN and Test REST API
# Description 
FRRouting (FRR) is a free and open source Internet routing protocol suite for Linux and Unix platforms. It implements BGP, OSPF, RIP, IS-IS, PIM, LDP, BFD, Babel, PBR, OpenFabric and VRRP, with alpha support for EIGRP and NHRP https://frrouting.org/ . 

This project is implemented to add REST APIs to FRRouting. Moreover, This version supports some protocols such as:\
**`OSPF`**\
**`BGP `**\
**`RIP`**\
**`STATIC`**\
**`Policy Based Routing`** \
**`Prefix-List`** \
**`Access-List`**   
**`Route-Map`** \
The other protocoles will be supportted in the future.

### Installation

#### Prerequisites

Frrouting must be installed from following link:\
http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html . \
And then
```
$ git clone https://github.com/Omidznlp/REST-API-FRRouting.git
$ cd REST-API-FRRouting
$ sudo python3.8 manage.py makemigrations
$ sudo python3.8 manage.py createsuperuser --email admin@example.com --username admin
$ sudo python3.8 manage.py migrate
$ ./setup.sh
```
### RUN and STOP

#### Run server

```
$ ./startup.sh <port number>
```
Exp:

```
$ ./startup.sh 8000

running server on port 8000
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).
July 12, 2020 - 12:56:28
Django version 3.0.7, using settings 'src.settings'
Starting development server at http://0.0.0.0:8000/
Quit the server with CONTROL-C.

```

#### Kill server

```
$./kill.sh <port number>
```

### Test
**` OSPF : ospf/README.md`**\
**`BGP : bgp/README.md`**\
**`RIP: rip/README.md`**\
**`STATIC: static/README.md`**\
**`Policy Routes includes PBR, Prefix-List, Access-List and Route-Map : policyroutes/README.md`**

### Write Configuration
REST API methodes write current configuration to configuration file.\

### Check Configuration
All REST API methods insert some commands into `FRRouting`. Moreover, We had better make sure whether they are inserted into it. To address, we can check the result of requests by running "show running-config" command in the following manner
to approve the functionally of REST APIs.
```
$ sudo vtysh
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
line vty
!
end
```
