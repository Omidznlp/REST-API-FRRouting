#!/bin/sh
if [[ $1 == "post" ]];then
  if [ -n "$2" ];then
    if [ -n "$3" ];then
      vtysh -c "conf t" -c "router bgp $2" -c "bgp router-id $3"
        if [ $? -eq 0 ];then
           echo "set router-id .. "
        else
           >&2 echo "Error : Failed set router-id"
           exit 1
        fi
    fi
    if [ -n "$4" ];then
      if [ -n "$6" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 remote-as $6"
          if [ $? -eq 0 ];then
             echo "set remote-as $6 "
          else
             >&2 echo "Error : Failed set remote-as $6"
             exit 1
          fi
      elif [[ $7 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 remote-as internal"
            if [ $? -eq 0 ];then
               echo "set remote-as internal "
            else
               >&2 echo "Error : Failed set remote-as internal"
               exit 1
            fi
      elif [[ $8 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 remote-as external"
            if [ $? -eq 0 ];then
               echo "set remote-as external "
            else
               >&2 echo "Error : Failed set remote-as external"
               exit 1
            fi
      fi
    elif [ -n "$5" ];then
        if [ -n "$6" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $5 interface remote-as $6"
            if [ $? -eq 0 ];then
               echo "set router-id .. "
            else
               >&2 echo "Error : Failed set router-id"
               exit 1
            fi
      elif [[ $7 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $5 interface remote-as internal"
            if [ $? -eq 0 ];then
               echo "set router-id .. "
            else
               >&2 echo "Error : Failed set router-id"
               exit 1
            fi
      elif [[ $8 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $5 interface remote-as external"
            if [ $? -eq 0 ];then
               echo "set router-id .. "
            else
               >&2 echo "Error : Failed set router-id"
               exit 1
            fi
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
      vtysh -c "conf t" -c "router bgp $2" -c "bgp router-id $3"
        if [ $? -eq 0 ];then
           echo "set router-id .. "
        else
           >&2 echo "Error : Failed set router-id"
           exit 1
        fi
    fi
    if [ -n "$4" ];then
      if [ -n "$6" ];then
        vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 remote-as $6"
          if [ $? -eq 0 ];then
             echo "set remote-as $6 "
          else
             >&2 echo "Error : Failed set remote-as $6"
             exit 1
          fi
      elif [[ $7 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 remote-as internal"
            if [ $? -eq 0 ];then
               echo "set remote-as internal "
            else
               >&2 echo "Error : Failed set remote-as internal"
               exit 1
            fi
      elif [[ $8 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $4 remote-as external"
            if [ $? -eq 0 ];then
               echo "set remote-as external "
            else
               >&2 echo "Error : Failed set remote-as external"
               exit 1
            fi
      fi
    elif [ -n "$5" ];then
        if [ -n "$6" ];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $5 interface remote-as $6"
            if [ $? -eq 0 ];then
               echo "set router-id .. "
            else
               >&2 echo "Error : Failed set router-id"
               exit 1
            fi
      elif [[ $7 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $5 interface remote-as internal"
            if [ $? -eq 0 ];then
               echo "set router-id .. "
            else
               >&2 echo "Error : Failed set router-id"
               exit 1
            fi
      elif [[ $8 == "True" ]];then
          vtysh -c "conf t" -c "router bgp $2" -c "neighbor $5 interface remote-as external"
            if [ $? -eq 0 ];then
               echo "set router-id .. "
            else
               >&2 echo "Error : Failed set router-id"
               exit 1
            fi
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
elif [[ $1 == "delete" ]];then
      vtysh -c "conf t" -c "no router bgp $2"
        if [ $? -eq 0 ]; then
           echo "deleted"
        else
           >&2 echo "Error : Failed deleted"
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
