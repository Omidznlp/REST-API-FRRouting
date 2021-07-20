#!/bin/sh
if [[ $1 == "post" ]];then
  if [ -n "$2" ];then
    vtysh -c "conf t" -c "router rip" -c "neighbor $2"
     if [ $? -eq 0 ];then
        echo "set neighbor "
     else
        >&2 echo "Error : Failed set neighbor"
        exit 1
     fi
  fi
  if [ -n "$3" ];then
    vtysh -c "conf t" -c "router rip" -c "passive-interface $3"
     if [ $? -eq 0 ];then
        echo "set passive interface "
     else
        >&2 echo "Error : Failed set passive interface "
        exit 1
     fi
  fi
  if [[ $4 == "True" ]];then
    vtysh -c "conf t" -c "router rip" -c "allow-ecmp"
     if [ $? -eq 0 ];then
        echo "set allow-ecmp "
     else
        >&2 echo "Error : Failed set allow-ecmp"
        exit 1
     fi
  fi
  if [[ $5 == "True" ]];then
    vtysh -c "conf t" -c "router rip" -c "default-information originate"
     if [ $? -eq 0 ];then
        echo "set default-information originate "
     else
        >&2 echo "Error : Failed set default-information originate"
        exit 1
     fi
  fi
  if [ -n "$6" ];then
    vtysh -c "conf t" -c "router rip" -c "redistribute $6"
     if [ $? -eq 0 ];then
        echo "set redistribute "
     else
        >&2 echo "Error : Failed set redistribute "
        exit 1
     fi
  fi
  if [ -n "$7" ];then
    vtysh -c "conf t" -c "router rip" -c "default-metric $7"
     if [ $? -eq 0 ];then
        echo "set default-metric "
     else
        >&2 echo "Error : Failed set default-metric "
        exit 1
     fi
  fi
  if [ -n "$8" ];then
    vtysh -c "conf t" -c "router rip" -c "distance $8"
     if [ $? -eq 0 ];then
        echo "set distance "
     else
        >&2 echo "Error : Failed set distance "
        exit 1
     fi
  fi
  if [ -n "$9" ];then
    vtysh -c "conf t" -c "router rip" -c "distribute-list prefix $9"
     if [ $? -eq 0 ];then
        echo "set distribute-list prefix "
     else
        >&2 echo "Error : Failed set distribute-list prefix "
        exit 1
     fi
  fi
  if [ -n "${10}" -a -n "${11}" -a -n "${12}" ];then
    vtysh -c "conf t" -c "router rip" -c "timers basic ${10} ${11} ${12}"
     if [ $? -eq 0 ];then
        echo "set timers basic "
     else
        >&2 echo "Error : Failed set timers basic "
        exit 1
     fi
  fi
  if [ -n "${13}" -a -n "${14}" ];then
    vtysh -c "conf t" -c "interface ${13}" -c "ip rip authentication key-chain ${14}"
     if [ $? -eq 0 ];then
        echo "set ip rip authentication key-chain "
     else
        >&2 echo "Error : Failed set ip rip authentication key-chain "
        exit 1
     fi
  fi
  if [ -n "${13}" -a -n "${15}" ];then
    vtysh -c "conf t" -c "interface ${13}" -c "ip rip authentication string ${15}"
     if [ $? -eq 0 ];then
        echo "set ip rip authentication string "
     else
        >&2 echo "Error : Failed sip rip authentication string "
        exit 1
     fi
  fi
  if [ -n "${13}" ] && [[ ${16} == "True" ]];then
    vtysh -c "conf t" -c "interface ${13}" -c "ip rip authentication mode md5"
     if [ $? -eq 0 ];then
        echo "set ip rip authentication mode md5 "
     else
        >&2 echo "Error : Failed set ip rip authentication mode md5 "
        exit 1
     fi
  elif [ -n "${13}" ] && [[ ${17} == "True" ]];then
      vtysh -c "conf t" -c "interface ${13}" -c "ip rip authentication mode text"
       if [ $? -eq 0 ];then
          echo "set ip rip authentication mode text "
       else
          >&2 echo "Error : Failed set ip rip authentication mode text "
          exit 1
       fi
  fi
  if [ -n "${13}" -a -n "${18}" ];then
    vtysh -c "conf t" -c "interface ${13}" -c "ip rip receive version ${18}"
     if [ $? -eq 0 ];then
        echo "set ip rip receive version "
     else
        >&2 echo "Error : Failed set ip rip receive version "
        exit 1
     fi
  fi
  if [ -n "${13}" -a -n "${19}" ];then
    vtysh -c "conf t" -c "interface ${13}" -c "ip rip send version ${19}"
     if [ $? -eq 0 ];then
        echo "set ip rip send version "
     else
        >&2 echo "Error : Failed set ip rip send version "
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
  if [[ $2 == "True" ]];then
    vtysh -c "conf t" -c "router rip" -c "allow-ecmp"
     if [ $? -eq 0 ];then
        echo "update allow-ecmp "
     else
        >&2 echo "Error : Failed update allow-ecmp"
        exit 1
     fi
  elif [[ $2 == "False" ]];then
      vtysh -c "conf t" -c "router rip" -c "no allow-ecmp"
       if [ $? -eq 0 ];then
          echo "update no allow-ecmp "
       else
          >&2 echo "Error : Failed update no allow-ecmp"
          exit 1
       fi
  fi
  if [[ $3 == "True" ]];then
    vtysh -c "conf t" -c "router rip" -c "default-information originate"
     if [ $? -eq 0 ];then
        echo "update default-information originate "
     else
        >&2 echo "Error : Failed update default-information originate"
        exit 1
     fi
  elif [[ $3 == "False" ]];then
      vtysh -c "conf t" -c "router rip" -c "no default-information originate"
       if [ $? -eq 0 ];then
          echo "update default-information originate "
       else
          >&2 echo "Error : Failed update default-information originate"
          exit 1
       fi
  fi
  if [ -n "$4" ];then
    vtysh -c "conf t" -c "router rip" -c "default-metric $4"
     if [ $? -eq 0 ];then
        echo "update default-metric "
     else
        >&2 echo "Error : Failed update default-metric "
        exit 1
     fi
  fi
  if [ -n "$5" ];then
    vtysh -c "conf t" -c "router rip" -c "distance $5"
     if [ $? -eq 0 ];then
        echo "update distance "
     else
        >&2 echo "Error : Failed update distance "
        exit 1
     fi
  fi
  if [ -n "${6}" -a -n "${7}" -a -n "${8}" ];then
    vtysh -c "conf t" -c "router rip" -c "timers basic ${6} ${7} ${8}"
     if [ $? -eq 0 ];then
        echo "update timers basic "
     else
        >&2 echo "Error : Failed update timers basic "
        exit 1
     fi
  fi
  if [ -n "$9" -a -n "${10}" ];then
    vtysh -c "conf t" -c "interface $9" -c "ip rip authentication key-chain ${10}"
     if [ $? -eq 0 ];then
        echo "update ip rip authentication key-chain "
     else
        >&2 echo "Error : Failed update ip rip authentication key-chain "
        exit 1
     fi
  fi
  if [ -n "$9" -a -n "${11}" ];then
    vtysh -c "conf t" -c "interface $9" -c "ip rip authentication string ${11}"
     if [ $? -eq 0 ];then
        echo "update ip rip authentication string "
     else
        >&2 echo "Error : Failed update ip rip authentication string "
        exit 1
     fi
  fi
  if [ -n "$9" ] && [[ ${12} == "True" ]];then
    vtysh -c "conf t" -c "interface $9" -c "ip rip authentication mode md5"
     if [ $? -eq 0 ];then
        echo "update ip rip authentication mode md5 "
     else
        >&2 echo "Error : Failed update ip rip authentication mode md5 "
        exit 1
     fi
  elif [ -n "$9" ] && [[ ${12} == "False" ]];then
      vtysh -c "conf t" -c "interface $9" -c "no ip rip authentication mode md5"
       if [ $? -eq 0 ];then
          echo "update no ip rip authentication mode md5 "
       else
          >&2 echo "Error : Failed set no ip rip authentication mode md5 "
          exit 1
       fi
  fi

   if [ -n "$9" ] && [[ ${13} == "True" ]];then
      vtysh -c "conf t" -c "interface $9" -c "ip rip authentication mode text"
       if [ $? -eq 0 ];then
          echo "update ip rip authentication mode text "
       else
          >&2 echo "Error : Failed set ip rip authentication mode text "
          exit 1
       fi
  elif [ -n "$9" ] && [[ ${13} == "False" ]];then
      vtysh -c "conf t" -c "interface $9" -c "no ip rip authentication mode text"
       if [ $? -eq 0 ];then
          echo "update no ip rip authentication mode text "
       else
          >&2 echo "Error : Failed update no ip rip authentication mode text "
          exit 1
       fi
  fi
  if [ -n "$9" -a -n "${14}" ];then
    vtysh -c "conf t" -c "interface $9" -c "ip rip receive version ${14}"
     if [ $? -eq 0 ];then
        echo "update ip rip receive version "
     else
        >&2 echo "Error : Failed update ip rip receive version "
        exit 1
     fi
  fi
  if [ -n "${13}" -a -n "${15}" ];then
    vtysh -c "conf t" -c "interface $9" -c "ip rip send version ${15}"
     if [ $? -eq 0 ];then
        echo "update ip rip send version"
     else
        >&2 echo "Error : Failed update ip rip send version "
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
     if [ -n "$2" ];then
       vtysh -c "conf t" -c "router rip" -c "no neighbor $2"
        if [ $? -eq 0 ]; then
           echo "deleted"
        else
           >&2 echo "Error : Failed deleted"
           exit 1
        fi
     fi
     if [  -n "$3" ];then
       vtysh -c "conf t" -c "router rip" -c "no passive-interface $3"
        if [ $? -eq 0 ]; then
           echo "deleted passive interface"
        else
           >&2 echo "Error : Failed deleted passive interface"
           exit 1
        fi
     fi
     if [ -n "$4" ];then
       vtysh -c "conf t" -c "router rip" -c "no distribute-list prefix $4"
          if [ $? -eq 0 ]; then
             echo "deleted distribute-list prefix"
          else
             >&2 echo "Error : Failed deleted distribute-list prefix"
          fi
     fi
     if [ -n "$5" ];then
       vtysh -c "conf t" -c "router rip" -c "no redistribute $5"
         if [ $? -eq 0 ];then
            echo "deleted redistribute "
         else
            >&2 echo "Error : Failed deleted redistribute "
            exit 1
         fi
     fi
     if [ -n "$6" ];then
       vtysh -c "conf t" -c "interface $6" -c " no ip rip authentication key-chain" -c " no ip rip authentication string" -c "no ip rip authentication mode" -c "no ip rip receive version" -c "no ip rip send version"
        if [ $? -eq 0 ]; then
           echo "deleted interface parameters"
        else
           >&2 echo "Error : Failed deleted interface parameters"
           exit 1
        fi
     fi
     vtysh -c "conf t" -c "router rip" -c "no allow-ecmp" -c "no default-information originate" -c "no default-metri" -c "no distance" -c "no timers basic"
       if [ $? -eq 0 ]; then
           echo "deleted global parameters"
       else
           >&2 echo "Error : Failed deleted global parameters"
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
