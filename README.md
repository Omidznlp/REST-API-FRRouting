
# Configuration, RUN and Test Web-UI

## Configuration
### Installation

Install frrouting from following under link:\
[http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html][http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html]
```
$ git clone  https://gitlab.network.com/main/dynamic_routing.git
$ cd dynamic_routing
$ cd web-ui
$ sudo python3.8 manage.py makemigrations
$ sudo python3.8 manage.py createsuperuser --email admin@example.com --username admin
$ sudo python3.8 manage.py migrate
$ ./setup.sh
```
### RUN
Run server

```
$ ./startup.sh <port number>
```

Kill server

```
$./kill.sh <port number>
```
Exp 1:

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
### Test
****` OSPF : ospf/README.md`**** \
****`Policy Routes : policyroutes/README.md`**** \
****`BGP : bgp/README.md`****\
****`RIP: rip/README.md`****\
****`STATIC: static/README.md`****\
### Write Configuration
All commands are inserted into frr by methods which are written permanently. we can use following command into frr for this purpose.
```
sudo vtysh

test# write
``` 
[http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html]: http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-ubuntu2004.html
