#! /bin/sh
if [[ $1 == "post" ]];then
   if [ -n "$4" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf hello-interval $4"
        if [ $? -eq 0 ];then
           echo "set hello interval"
        else
           >&2 echo "Error: Failed set hello interval"
           exit 1
        fi
   fi
   if [ -n "$5" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf retransmit-interval $5"
        if [ $? -eq 0 ];then
           echo "set retransmit-interval"
        else
           >&2 echo "Error: Failed set ip ospf retransmit-interval"
           exit 1
         fi
   fi
   if [ -n "$6" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf transmit-delay $6"
        if [ $? -eq 0 ];then
           echo "set transmit-delay"
        else
           >&2 echo "Error: Failed set ip ospf transmit-delay"
           exit 1
        fi
   fi
   if [ -n "$7" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf dead-interval $7"
        if [ $? -eq 0 ];then
           echo "set dead-interval"
        else
           >&2 echo "Error: Failed set dead-interval"
           exit 1
        fi
   fi
   if [ -n "$8" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf cost $8"
        if [ $? -eq 0 ];then
           echo "set cost"
        else
           >&2 echo "Error: Failed set cost"
           exit 1
        fi
   fi
   if [ -n "$9" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf priority $9"
        if [ $? -eq 0 ];then
           echo "set priority"
        else
           >&2 echo "Error: Failed set priority"
           exit 1
        fi
   fi
   if [ -n "${10}" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf network ${10} "
        if [ $? -eq 0 ];then
           echo "set network type"
        else
           >&2 echo "Error: Failed set network type"
           exit 1
        fi
   fi
   if [ -n "${11}" ];then
     if [[ "${11}" == "True" ]];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf authentication message-digest"
        if [ $? -eq 0 ];then
           echo "set ip ospf authentication message-digest"
        else
           >&2 echo "Error: Failed set ip ospf authentication message-digest"
           exit 1
        fi
     fi
   fi
   if [ -n "${12}" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf authentication-key ${12}"
        if [ $? -eq 0 ];then
           echo "set ip ospf authentication-key"
        else
           >&2 echo "Error: Failed ip ospf authentication-key"
           exit 1
        fi
   fi
   if [ -n "${13}" -a -n "${14}" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf message-digest-key ${13} md5 ${14}"
        if [ $? -eq 0 ];then
           echo "set  ip ospf message-digest-key KEYID md5 KEY"
        else
           >&2 echo "Error: Failed  ip ospf message-digest-key KEYID md5 KEY"
           exit 1
        fi
   fi
  vtysh -c "write"
    if [ $? -eq 0 ];then
       echo "write config"
       exit 0
    else
       >&2 echo "Error : Failed write config"
       exit 1
    fi
elif [[ $1 == "put" ]];then
   if [ -n "$4" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf hello-interval $4"
        if [ $? -eq 0 ];then
           echo "inserted hello interval"
        else
           >&2 echo "Error: Failed set hello interval"
           exit 1
        fi
   fi
   if [ -n "$5" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf retransmit-interval $5"
        if [ $? -eq 0 ];then
           echo "set retransmit-interval"
        else
           >&2 echo "Error: Failed set ip ospf retransmit-interval"
           exit 1
         fi
   fi
   if [ -n "$6" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf transmit-delay $6"
        if [ $? -eq 0 ];then
           echo "set transmit-delay"
        else
           >&2 echo "Error: Failed set ip ospf transmit-delay"
           exit 1
        fi
   fi
   if [ -n "$7" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf dead-interval $7"
        if [ $? -eq 0 ];then
           echo "set dead-interval"
        else
           >&2 echo "Error: Failed set dead-interval"
           exit 1
        fi
   fi
   if [ -n "$8" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf cost $8"
        if [ $? -eq 0 ];then
           echo "set cost"
        else
           >&2 echo "Error: Failed set cost"
           exit 1
        fi
   fi
   if [ -n "$9" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf priority $9"
        if [ $? -eq 0 ];then
           echo "set priority"
        else
           >&2 echo "Error: Failed set priority"
           exit 1
        fi
   fi
   if [ -n "${10}" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf network ${10} "
        if [ $? -eq 0 ];then
           echo "set network type"
        else
           >&2 echo "Error: Failed set network type"
           exit 1
        fi
   fi
   if [ -n "${11}" ];then
     if [[ "${11}" == "True" ]];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf authentication message-digest"
        if [ $? -eq 0 ];then
           echo "set ip ospf authentication message-digest"
        else
           >&2 echo "Error: Failed set ip ospf authentication message-digest"
           exit 1
        fi
     fi
   fi
   if [ -n "${12}" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf authentication-key ${12}"
        if [ $? -eq 0 ];then
           echo "set ip ospf authentication-key"
        else
           >&2 echo "Error: Failed ip ospf authentication-key"
           exit 1
        fi
   fi
   if [ -n "${13}" -a -n "${14}" ];then
      vtysh -c "conf t" -c "interface $3" -c "ip ospf message-digest-key ${13} md5 ${14}"
        if [ $? -eq 0 ];then
           echo "set  ip ospf message-digest-key KEYID md5 KEY"
        else
           >&2 echo "Error: Failed  ip ospf message-digest-key KEYID md5 KEY"
           exit 1
        fi
   fi
   vtysh -c "write"
     if [ $? -eq 0 ];then
        echo "write config"
        exit 0
     else
        >&2 echo "Error : Failed write config"
        exit 1
     fi
elif [[ $1 == "delete" ]];then
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf hello-interval"
     if [ $? -eq 0 ];then
        echo "deleted hello interval"
     else
        >&2 echo "Error: Failed delete hello interval"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf retransmit-interval"
     if [ $? -eq 0 ];then
        echo "delete retransmit-interval"
     else
        >&2 echo "Error: Failed delete ip ospf retransmit-interval"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf transmit-delay"
     if [ $? -eq 0 ];then
        echo "delete transmit-delay"
     else
        >&2 echo "Error: Failed delete ip ospf transmit-delay"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf dead-interval"
     if [ $? -eq 0 ];then
        echo "set dead-interval"
     else
        >&2 echo "Error: Failed delete dead-interval"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf cost"
     if [ $? -eq 0 ];then
        echo "delete cost"
     else
        >&2 echo "Error: Failed delete cost"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf priority"
     if [ $? -eq 0 ];then
        echo "delete priority"
     else
        >&2 echo "Error: Failed delete priority"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf network"
     if [ $? -eq 0 ];then
        echo "delete network type"
     else
        >&2 echo "Error: Failed delete network type"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf authentication message-digest"
     if [ $? -eq 0 ];then
        echo "delete ip ospf authentication message-digest"
     else
        >&2 echo "Error: Failed set ip ospf authentication message-digest"
        exit 1
     fi
   vtysh -c "conf t" -c "interface $2" -c "no ip ospf authentication-key"
     if [ $? -eq 0 ];then
        echo "delete ip ospf authentication-key"
     else
        >&2 echo "Error: Failed delete ip ospf authentication-key"
        exit 1
     fi
   if [ -n "$3" ];then
     vtysh -c "conf t" -c "interface $2" -c "no ip ospf message-digest-key $3"
       if [ $? -eq 0 ];then
          echo "delete ip ospf message-digest-key KEYID md5 KEY"
       else
          >&2 echo "Error: Failed delete ip ospf message-digest-key KEYID md5 KEY"
       fi
   fi
   vtysh -c "write"
     if [ $? -eq 0 ];then
        echo "write config"
        exit 0
     else
        >&2 echo "Error : Failed write config"
        exit 1
     fi
fi
