#!/bin/sh
if [[ $1 == "post" ]];then
   if [ -n "$2" -a -n "$3" ];then
     if [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$7" -a -n "$8" ];then
       vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6 le $7 ge $8"
          if [ $? -eq 0 ];then
             echo "set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN] [ge LEN]"
          else
             >&2 echo "Error: Failed set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN] [ge LEN]"
             exit 1
          fi
     elif [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$7" ];then
        vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6 le $7"
          if [ $? -eq 0 ];then
             echo "set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN]"
          else
             >&2 echo "Error: Failed set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN]"
             exit 1
          fi
     elif [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$8" ];then
        vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6 ge $8"
          if [ $? -eq 0 ];then
             echo "set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [ge LEN]"
          else
             >&2 echo "Error: Failed set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [ge LEN]"
             exit 1
          fi
     elif [ -n "$4" -a -n "$5" -a -n "$6" ];then
        vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6"
          if [ $? -eq 0 ];then
             echo "set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX "
          else
             >&2 echo "Error: Failed set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX "
             exit 1
          fi
     else
        echo "there is no match field"
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
elif [[ $1 == "put" ]];then
   if [ -n "$2" -a -n "$3" ];then
     if [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$7" -a -n "$8" ];then
       vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6 le $7 ge $8"
          if [ $? -eq 0 ];then
             echo "update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN] [ge LEN]"
          else
             >&2 echo "Error: Failed set ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN] [ge LEN]"
             exit 1
          fi
     elif [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$7" ];then
        vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6 le $7"
          if [ $? -eq 0 ];then
             echo "update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN]"
          else
             >&2 echo "Error: Failed update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN]"
             exit 1
          fi
     elif [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$8" ];then
        vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6 ge $8"
          if [ $? -eq 0 ];then
             echo "update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [ge LEN]"
          else
             >&2 echo "Error: Failed update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [ge LEN]"
             exit 1
          fi
     elif [ -n "$4" -a -n "$5" -a -n "$6" ];then
        vtysh -c "conf t" -c "ip prefix-list $3 seq $2 $4 $5/$6"
          if [ $? -eq 0 ];then
             echo "update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX "
          else
             >&2 echo "Error: Failed update ip prefix-list NAME seq NUMBER (permit|deny) PREFIX "
             exit 1
          fi
     else
        echo "there is no match field"
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
elif [[ $1 == "delete" ]];then
   if [ -n "$2" -a -n "$3" ];then
       vtysh -c "conf t" -c "no ip prefix-list $3 seq $2"
          if [ $? -eq 0 ];then
             echo "delete ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN] [ge LEN]"
          else
             >&2 echo "Error: Failed delete ip prefix-list NAME seq NUMBER (permit|deny) PREFIX [le LEN] [ge LEN]"
             exit 1
          fi
   else
      echo "there is no match field"
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
