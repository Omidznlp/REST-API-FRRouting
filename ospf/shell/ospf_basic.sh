#!/bin/sh
if [[ $1 == "post" ]];then
  vtysh -c "conf t" -c "router ospf $2" -c "ospf router-id $3" -c "interface $4" -c "ip ospf $2 area $5"
   if [ $? -eq 0 ];then
      echo "started .. "
      exit 0
   else
      >&2 echo "Error : Failed set"
      exit 1
   fi
elif [[ $1 == "put" ]];then
     if [ -n "$3" ];then
       vtysh -c "conf t" -c "router ospf $2" -c "ospf router-id $3"
        if [ $? -eq 0 ]; then
           echo "router-id updated"
        else
           >&2 echo "Error : Failed set router-id"
        fi
     fi
     if [ -n "$4" -a -n "$5" ];then
       vtysh -c "conf t" -c "interface $4" -c "no ip opsf $3 area $5"
        if [ $? -eq 0 ];then
           echo "updated ... "
           exit 0
        else
           >&2 echo "Error : Failed set"
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
elif [[ $1 == "delete" ]];then
     vtysh -c "conf t" -c "no router ospf $2"
       if [ $? -eq 0 ]; then
          echo "deleted"
       else
          >&2 echo "Error : Failed set router-id"
       fi
     vtysh -c "write"
       if [ $? -eq 0 ];then
          echo "write config"
       else
          >&2 echo "Error : Failed write config"
          exit 1
       fi
fi
