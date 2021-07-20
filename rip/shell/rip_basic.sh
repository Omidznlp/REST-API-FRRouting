#!/bin/sh
if [[ $1 == "post" ]];then
  if [ -n "$2" -a -n "$3" ];then
    vtysh -c "conf t" -c "router rip" -c "network $2/$3"
     if [ $? -eq 0 ];then
        echo "set network addr/prefix "
     else
        >&2 echo "Error : Failed set network addr/prefix"
        exit 1
     fi
  fi
  if [ -n "$4" ];then
    vtysh -c "conf t" -c "router rip" -c "network $4"
     if [ $? -eq 0 ];then
        echo "set network interface "
     else
        >&2 echo "Error : Failed set network interface"
        exit 1
     fi
  fi
  if [ -n "$5" ];then
    vtysh -c "conf t" -c "router rip" -c "version $5"
     if [ $? -eq 0 ];then
        echo "set version "
     else
        >&2 echo "Error : Failed set version"
        exit 1
     fi
  fi
  vtysh -c "write"
    if [ $? -eq 0 ];then
       echo "write config"
    else
       >&2 echo "Error : Failed write config"
       exit 1
    fi
elif [[ $1 == "put" ]];then
     if [ -n "$1" ];then
       vtysh -c "conf t" -c "router rip" -c "version $2"
        if [ $? -eq 0 ]; then
           echo "update version"
        else
           >&2 echo "Error : Failed update version"
        fi
     fi
     vtysh -c "write"
       if [ $? -eq 0 ];then
          echo "write config"
       else
          >&2 echo "Error : Failed write config"
          exit 1
       fi
elif [[ $1 == "delete" ]];then
       vtysh -c "conf t" -c "no router rip"
        if [ $? -eq 0 ]; then
           echo "deleted"
        else
           >&2 echo "Error : Failed deleted"
           exit 1
        fi
       vtysh -c "write"
         if [ $? -eq 0 ];then
            echo "write config"
         else
            >&2 echo "Error : Failed write config"
            exit 1
         fi
fi
