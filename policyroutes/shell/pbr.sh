#!/bin/sh
if [[ $1 == "post" ]];then
   if [ -n "$2" ];then
     vtysh -c "conf t" -c "nexthop-group $2"
        if [ $? -eq 0 ];then
           echo "set nexthop-group"
        else
           >&2 echo "Error: Failed set nexthop-group"
           exit 1
        fi
     if [ -n "$3" ];then
        vtysh -c "conf t" -c "nexthop-group $2" -c "nexthop $3"
          if [ $? -eq 0 ];then
             echo "set nexthop ip"
          else
             >&2 echo "Error: Failed set nexthop ip"
             exit 1
          fi
     fi
     if [ -n "$5" -a "$4" ];then
        vtysh -c "conf t" -c "nexthop-group $2" -c "nexthop $4 label $5"
          if [ $? -eq 0 ];then
             echo "set nexthop label"
          else
             >&2 echo "Error: Failed set nexthop label"
             exit 1
          fi
     elif [ -n "$4" ];then
        vtysh -c "conf t" -c "nexthop-group $2" -c "nexthop $4"
          if [ $? -eq 0 ];then
             echo "set nexthop interface"
          else
             >&2 echo "Error: Failed set nexthop interface"
             exit 1
          fi
     fi
   fi
   if [ -n "$6" -a -n "$7" ];then
      vtysh -c "conf t" -c "pbr-map $6 seq $7"
        if [ $? -eq 0 ];then
           echo "pbr-map $6 seq $7"
        else
           >&2 echo "Error: Failed pbr-map $6 $7"
           exit 1
        fi
        if [ -n "$8" -a -n "$9" ];then
           vtysh -c "conf t" -c "pbr-map $6 seq $7" -c "match src-ip $8/$9 "
             if [ $? -eq 0 ];then
                echo "set match src-ip"
             else
                >&2 echo "Error: Failed set match src-ip "
                exit 1
             fi
        fi
        if [ -n "${10}" -a -n "${11}" ];then
           vtysh -c "conf t" -c "pbr-map $6 seq $7" -c "match dst-ip ${10}/${11} "
             if [ $? -eq 0 ];then
                echo "set match src-dst"
             else
                >&2 echo "Error: Failed set match src-dst"
                exit 1
             fi
        fi
        if [ -n "${12}" ];then
           vtysh -c "conf t" -c "pbr-map $6 seq $7" -c "match mark ${12}"
             if [ $? -eq 0 ];then
                echo "set match mark"
             else
                >&2 echo "Error: Failed match marky"
                exit 1
             fi
        fi
        if [ -n "${13}" ];then
           vtysh -c "conf t" -c "pbr-map $6 seq $7"  -c "set nexthop-group ${13}"
             if [ $? -eq 0 ];then
                echo "set set-nexthop-group "
             else
                >&2 echo "Error: Failed set-nexthop-group"
                exit 1
             fi
        else
          if [ -n "${14}" ];then
             vtysh -c "conf t" -c "pbr-map $6 seq $7"  -c "set nexthop ${14}"
               if [ $? -eq 0 ];then
                  echo "set set nexthop ip"
               else
                  >&2 echo "Error: Failed set nexthop ip"
                  exit 1
               fi
          elif [ -n "${15}" ];then
             vtysh -c "conf t" -c "pbr-map $6 seq $7"  -c "set nexthop ${15}"
               if [ $? -eq 0 ];then
                  echo "set nexthop interface"
               else
                  >&2 echo "Error: Failed set nexthop interface"
                  exit 1
               fi
          fi
        fi
     if [ -n "${16}" ];then
        vtysh -c "conf t" -c "interface ${16} " -c "pbr-policy $6"
          if [ $? -eq 0 ];then
             echo "set ip pbr-policy"
          else
             >&2 echo "Error: Failed pbr-policy"
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
   fi
elif [[ $1 == "delete" ]];then
   if [ -n "$2" -a -n "$3" -a -n "$4" -a "$5" ];then
     vtysh -c "conf t" -c "no nexthop-group $2"
        if [ $? -eq 0 ];then
           echo "delete nexthop-group"
        else
           >&2 echo "Error: Failed delete nexthop-group"
           exit 1
        fi
     vtysh -c "conf t" -c "no pbr-map ${3} seq ${4}"
        if [ $? -eq 0 ];then
           echo "delete pbr-map ${3} seq ${4}"
        else
           >&2 echo "Error: Failed delete pbr-map ${3} seq ${4}"
           exit 1
        fi
     vtysh -c "conf t" -c "interface ${5} " -c "no pbr-policy ${3}"
        if [ $? -eq 0 ];then
           echo "delete ip pbr-policy"
        else
           >&2 echo "Error: Failed delete pbr-policy"
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
fi
