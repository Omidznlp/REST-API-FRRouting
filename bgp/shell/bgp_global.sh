#!/bin/sh
if [[ $1 == "post" ]];then
  if [ -n "$2" ];then
    if [ -n "$3" ];then
      if [ -n "$5" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 update-source $5"
          if [ $? -eq 0 ];then
             echo "set update-source addr "
          else
             >&2 echo "Error : Failed set update-source addr "
             exit 1
          fi
      elif [ -n "$6" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 update-source $6"
            if [ $? -eq 0 ];then
               echo "set update-source interface "
            else
               >&2 echo "Error : Failed set update-source interface"
               exit 1
            fi
      fi
      if [[ $7 == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ebgp-multihop"
          if [ $? -eq 0 ];then
             echo "set ebgp-multihop "
          else
             >&2 echo "Error : Failed set ebgp-multihop"
             exit 1
          fi
      elif [ -n "$8" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ebgp-multihop $8"
            if [ $? -eq 0 ];then
               echo "set ebgp-multihop number hop "
            else
               >&2 echo "Error : Failed set ebgp-multihop number hop"
               exit 1
            fi
      fi
      if [[ ${9} == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 shutdown"
          if [ $? -eq 0 ];then
             echo "set shutdown "
          else
             >&2 echo "Error : Failed set shutdown"
             exit 1
          fi
      fi
      if [ -n "${10}" -a -n "${11}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 timers ${10} ${11}"
          if [ $? -eq 0 ];then
             echo "set timers "
          else
             >&2 echo "Error : Failed set timers"
             exit 1
          fi
      fi
      if [ -n "${12}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 timers connect ${12}"
          if [ $? -eq 0 ];then
             echo "set timers connect "
          else
             >&2 echo "Error : Failed set timers connectn"
             exit 1
          fi
      fi
      if [ -n "${13}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 password ${13}"
          if [ $? -eq 0 ];then
             echo "set password "
          else
             >&2 echo "Error : Failed set password"
             exit 1
          fi
      fi
      if [[ ${14} == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 passive"
          if [ $? -eq 0 ];then
             echo "set passive "
          else
             >&2 echo "Error : Failed set passive"
             exit 1
          fi
      fi
      if [ -n "${15}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ttl-security hops ${15}"
          if [ $? -eq 0 ];then
             echo "set ttl-security hops  "
          else
             >&2 echo "Error : Failed set ttl-security hops "
             exit 1
          fi
      fi
    elif [ -n "$4" ];then
      if [ -n "$5" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 update-source $5"
          if [ $? -eq 0 ];then
             echo "set update-source addr "
          else
             >&2 echo "Error : Failed set update-source addr "
             exit 1
          fi
      elif [ -n "$6" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 update-source $6"
            if [ $? -eq 0 ];then
               echo "set update-source interface "
            else
               >&2 echo "Error : Failed set update-source interface"
               exit 1
            fi
      fi
      if [[ $7 == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 ebgp-multihop"
          if [ $? -eq 0 ];then
             echo "set ebgp-multihop "
          else
             >&2 echo "Error : Failed set ebgp-multihop"
             exit 1
          fi
      elif [ -n "$8" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 ebgp-multihop $8"
            if [ $? -eq 0 ];then
               echo "set ebgp-multihop number hop "
            else
               >&2 echo "Error : Failed set ebgp-multihop number hop"
               exit 1
            fi
      fi
      if [[ ${9} == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 shutdown"
          if [ $? -eq 0 ];then
             echo "set shutdown "
          else
             >&2 echo "Error : Failed set shutdown"
             exit 1
          fi
      fi
      if [ -n "${10}" -a -n "${11}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 timers ${10} ${11}"
          if [ $? -eq 0 ];then
             echo "set timers "
          else
             >&2 echo "Error : Failed set timers"
             exit 1
          fi
      fi
      if [ -n "${12}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 timers connect ${12}"
          if [ $? -eq 0 ];then
             echo "set timers connect "
          else
             >&2 echo "Error : Failed set timers connect"
             exit 1
          fi
      fi
      if [ -n "${13}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 password ${13}"
          if [ $? -eq 0 ];then
             echo "set password ${13}"
          else
             >&2 echo "Error : Failed set password ${13}"
             exit 1
          fi
      fi
      if [[ ${14} == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 passive"
          if [ $? -eq 0 ];then
             echo "set passive "
          else
             >&2 echo "Error : Failed set passive"
             exit 1
          fi
      fi
      if [ -n "${15}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 ttl-security hops ${15}"
          if [ $? -eq 0 ];then
             echo "set ttl-security hops "
          else
             >&2 echo "Error : Failed set ttl-security hops"
             exit 1
          fi
      fi
    fi
    if [ -n "${16}" -a -n "${17}" ];then
      vtysh -c "conf t" -c "router bgp $2" -c "timers bgp ${16} ${17}"
          if [ $? -eq 0 ];then
             echo "set timers bgp "
          else
             >&2 echo "Error : Failed set timers bgp"
             exit 1
          fi
    fi
    if [ -n "${18}" ];then
      vtysh -c "conf t" -c "router bgp $2" -c "update-delay ${18}"
        if [ $? -eq 0 ];then
           echo "set update-delay "
        else
           >&2 echo "Error : Failed set update-delay"
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
  fi
elif [[ $1 == "put" ]];then
  if [ -n "$2" ];then
    if [ -n "$3" ];then
      if [ -n "$5" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 update-source $5"
          if [ $? -eq 0 ];then
             echo "set update-source addr "
          else
             >&2 echo "Error : Failed set update-source addr "
             exit 1
          fi
      elif [ -n "$6" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 update-source $6"
            if [ $? -eq 0 ];then
               echo "set update-source interface "
            else
               >&2 echo "Error : Failed set update-source interface"
               exit 1
            fi
      fi
      if [[ $7 == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ebgp-multihop"
          if [ $? -eq 0 ];then
             echo "set ebgp-multihop "
          else
             >&2 echo "Error : Failed set ebgp-multihop"
             exit 1
          fi
      elif [ -n "$8" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ebgp-multihop $8"
            if [ $? -eq 0 ];then
               echo "set ebgp-multihop number hop "
            else
               >&2 echo "Error : Failed set ebgp-multihop number hop"
               exit 1
            fi
      fi
      if [[ $7 == "False" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "no neighbor $3 ebgp-multihop"
          if [ $? -eq 0 ];then
             echo "update no ebgp-multihop "
          else
             >&2 echo "Error : Failed update no ebgp-multihop"
             exit 1
          fi
      elif [ -n "$8" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ebgp-multihop $8"
            if [ $? -eq 0 ];then
               echo "set ebgp-multihop number hop "
            else
               >&2 echo "Error : Failed set ebgp-multihop number hop"
               exit 1
            fi
      fi
      if [[ ${9} == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 shutdown"
          if [ $? -eq 0 ];then
             echo "update shutdown "
          else
             >&2 echo "Error : Failed update shutdown"
             exit 1
          fi
      elif [[ ${9} == "False" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 shutdown"
            if [ $? -eq 0 ];then
               echo "update no shutdown "
            else
               >&2 echo "Error : Failed update no shutdown"
               exit 1
            fi
      fi
      if [ -n "${10}" -a -n "${11}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 timers ${10} ${11}"
          if [ $? -eq 0 ];then
             echo "set timers "
          else
             >&2 echo "Error : Failed set timers"
             exit 1
          fi
      fi
      if [ -n "${12}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 timers connect ${12}"
          if [ $? -eq 0 ];then
             echo "set timers connect "
          else
             >&2 echo "Error : Failed set timers connectn"
             exit 1
          fi
      fi
      if [ -n "${13}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 password ${13}"
          if [ $? -eq 0 ];then
             echo "set password "
          else
             >&2 echo "Error : Failed set password"
             exit 1
          fi
      fi
      if [[ ${14} == "True" ]];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 passive"
          if [ $? -eq 0 ];then
             echo "update passive "
          else
             >&2 echo "Error : Failed update passive"
             exit 1
          fi
      elif [[ ${14} == "False" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 passive"
            if [ $? -eq 0 ];then
               echo "update no passive "
            else
               >&2 echo "Error : Failed update no passive"
               exit 1
            fi
      fi
      if [ -n "${15}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ttl-security hops ${15}"
          if [ $? -eq 0 ];then
             echo "set password "
          else
             >&2 echo "Error : Failed set password"
             exit 1
          fi
      fi
    elif [ -n "$4" ];then
        if [ -n "$5" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 update-source $5"
            if [ $? -eq 0 ];then
               echo "set update-source addr "
            else
               >&2 echo "Error : Failed set update-source addr "
               exit 1
            fi
        elif [ -n "$6" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 update-source $6"
              if [ $? -eq 0 ];then
                 echo "set update-source interface "
              else
                 >&2 echo "Error : Failed set update-source interface"
                 exit 1
              fi
        fi
        if [[ $7 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 ebgp-multihop"
            if [ $? -eq 0 ];then
               echo "set ebgp-multihop "
            else
               >&2 echo "Error : Failed set ebgp-multihop"
               exit 1
            fi
        elif [ -n "$8" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 ebgp-multihop $8"
              if [ $? -eq 0 ];then
                 echo "set ebgp-multihop number hop "
              else
                 >&2 echo "Error : Failed set ebgp-multihop number hop"
                 exit 1
              fi
        fi
        if [[ $7 == "False" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "no neighbor $3 ebgp-multihop"
            if [ $? -eq 0 ];then
               echo "update no ebgp-multihop "
            else
               >&2 echo "Error : Failed update no ebgp-multihop"
               exit 1
            fi
        elif [ -n "$8" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 ebgp-multihop $8"
              if [ $? -eq 0 ];then
                 echo "set ebgp-multihop number hop "
              else
                 >&2 echo "Error : Failed set ebgp-multihop number hop"
                 exit 1
              fi
        fi
        if [[ ${9} == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 shutdown"
            if [ $? -eq 0 ];then
               echo "update shutdown "
            else
               >&2 echo "Error : Failed update shutdown"
               exit 1
            fi
        elif [[ ${9} == "False" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 shutdown"
              if [ $? -eq 0 ];then
                 echo "update no shutdown "
              else
                 >&2 echo "Error : Failed update no shutdown"
                 exit 1
              fi
        fi
        if [ -n "${10}" -a -n "${11}" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 timers ${10} ${11}"
            if [ $? -eq 0 ];then
               echo "set timers "
            else
               >&2 echo "Error : Failed set timers"
               exit 1
            fi
        fi
        if [ -n "${12}" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 timers connect ${12}"
            if [ $? -eq 0 ];then
               echo "set timers connect "
            else
               >&2 echo "Error : Failed set timers connectn"
               exit 1
            fi
        fi
        if [ -n "${13}" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 password ${13}"
            if [ $? -eq 0 ];then
               echo "set password "
            else
               >&2 echo "Error : Failed set password"
               exit 1
            fi
        fi
        if [[ ${14} == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 passive"
            if [ $? -eq 0 ];then
               echo "update passive "
            else
               >&2 echo "Error : Failed update passive"
               exit 1
            fi
        elif [[ ${14} == "False" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "neighbor $3 passive"
              if [ $? -eq 0 ];then
                 echo "update no passive "
              else
                 >&2 echo "Error : Failed update no passive"
                 exit 1
              fi
        fi
        if [ -n "${15}" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 ttl-security hops ${15}"
            if [ $? -eq 0 ];then
               echo "set password "
            else
               >&2 echo "Error : Failed set password"
               exit 1
            fi
        fi
      fi
      if [ -n "${16}" -a -n "${17}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "timers bgp ${16} ${17}"
            if [ $? -eq 0 ];then
               echo "set password "
            else
               >&2 echo "Error : Failed set password"
               exit 1
            fi
      fi
      if [ -n "${18}" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "update-delay ${18}"
          if [ $? -eq 0 ];then
             echo "set password "
          else
             >&2 echo "Error : Failed set password"
             exit 1
          fi
      fi
  fi
elif [[ $1 == "delete" ]];then
  if [ -n "$3" -a -n "$5" ];then
    vtysh -c "conf t" -c "router bgp $2" -c "no neighbor $3 update-source " -c "no neighbor $3 ebgp-multihop" -c "no neighbor $3 shutdown" -c "no neighbor $3 timers" -c "no neighbor $3 timers connect" -c "no neighbor $3 passive" -c "no neighbor $3 password"  -c "no timers bgp" -c "no update-delay" -c "no neighbor $3 ttl-security hops $5"
      if [ $? -eq 0 ]; then
         echo "deleted"
      else
         >&2 echo "Error : Failed deleted"
         exit 1
      fi
  elif [ -n "$4" -a -n "$5" ];then
      vtysh -c "conf t" -c "router bgp $2" -c "no neighbor $4 update-source " -c "no neighbor $4 ebgp-multihop" -c "no neighbor $4 shutdown" -c "no neighbor $4 timers" -c "no neighbor $4 timers connect" -c "no neighbor $4 passive" -c "no neighbor $4 password" -c "no timers bgp" -c "no update-delay" -c "no neighbor $4 ttl-security hops $5"
        if [ $? -eq 0 ]; then
           echo "deleted"
        else
           >&2 echo "Error : Failed deleted"
           exit 1
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
fi
