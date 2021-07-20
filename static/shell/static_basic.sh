#!/bin/sh
if [[ $1 == "post" ]];then
  if [ -n "$2" -a -n "$3" ];then
    if [ -n "$4" -a -n "$7" ];then
      vtysh -c "conf t" -c "ip route $2/$3 $4 $7"
       if [ $? -eq 0 ];then
          echo "set ip route gateway distance"
       else
          >&2 echo "Error : Failed set ip route gateway distance "
          exit 1
       fi
    elif [ -n "$4" -a -z "$7" ];then
        vtysh -c "conf t" -c "ip route $2/$3 $4"
         if [ $? -eq 0 ];then
            echo "set ip route gateway  "
         else
            >&2 echo "Error : Failed set ip route gateway "
            exit 1
         fi
    fi
    if [ -n "$5" -a -n "$7" ];then
      vtysh -c "conf t" -c "ip route $2/$3 $5 $7"
        if [ $? -eq 0 ];then
           echo "set ip route interface gateway distance "
        else
           >&2 echo "Error : Failed set ip route interface gateway distance"
           exit 1
        fi
    elif [ -n "$5" -a -z "$7" ];then
        vtysh -c "conf t" -c "ip route $2/$3 $5"
          if [ $? -eq 0 ];then
             echo "set ip route interface gateway "
          else
             >&2 echo "Error : Failed set ip route interface gateway"
             exit 1
          fi
    fi
    if [[ $6 == "True" ]];then
      vtysh -c "conf t" -c "ip route $2/$3 Null0"
       if [ $? -eq 0 ];then
          echo "set ip route Null0 "
       else
          >&2 echo "Error : Failed set ip route Null0"
          exit 1
       fi
    fi
    if [[ $8 == "True" ]];then
      vtysh -c "conf t" -c "ip route $2/$3 reject"
       if [ $? -eq 0 ];then
          echo "set ip route reject "
       else
          >&2 echo "Error : Failed set ip route reject"
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
elif [[ $1 == "put" ]];then
  if [ -n "$2" -a -n "$3" ];then
    if [ -n "$4" -a -n "$7" ];then
      vtysh -c "conf t" -c "ip route $2/$3 $4 $7"
       if [ $? -eq 0 ];then
          echo "update ip route gateway distance"
       else
          >&2 echo "Error : Failed update ip route gateway distance "
          exit 1
       fi
    elif [ -n "$4" -a -z "$7" ];then
        vtysh -c "conf t" -c "ip route $2/$3 $4"
         if [ $? -eq 0 ];then
            echo "update ip route gateway  "
         else
            >&2 echo "Error : Failed update ip route gateway "
            exit 1
         fi
    fi
    if [ -n "$5" -a -n "$7" ];then
      vtysh -c "conf t" -c "ip route $2/$3 $5 $7"
        if [ $? -eq 0 ];then
           echo "update ip route interface gateway distance "
        else
           >&2 echo "Error : Failed update ip route interface gateway distance"
           exit 1
        fi
    elif [ -n "$5" -a -z "$7" ];then
        vtysh -c "conf t" -c "ip route $2/$3 $5"
          if [ $? -eq 0 ];then
             echo "update ip route interface gateway "
          else
             >&2 echo "Error : Failed update ip route interface gateway"
             exit 1
          fi
    fi
    if [[ $6 == "True" ]];then
      vtysh -c "conf t" -c "ip route $2/$3 Null0"
       if [ $? -eq 0 ];then
          echo "update ip route Null0 "
       else
          >&2 echo "Error : Failed update set ip route Null0"
          exit 1
       fi
    elif [[ $6 == "False" ]];then
      vtysh -c "conf t" -c "no ip route $2/$3 Null0"
       if [ $? -eq 0 ];then
          echo "update no ip route Null0 "
       else
          >&2 echo "Error : Failed update no ip route Null0"
          exit 1
       fi
    fi
    if [[ $8 == "True" ]];then
      vtysh -c "conf t" -c "ip route $2/$3 reject"
       if [ $? -eq 0 ];then
          echo "update ip route reject "
       else
          >&2 echo "Error : Failed update ip route reject"
          exit 1
       fi
    elif [[ $8 == "False" ]];then
        vtysh -c "conf t" -c "no ip route $2/$3 reject"
          if [ $? -eq 0 ];then
             echo "update no ip route reject "
          else
             >&2 echo "Error : Failed no ip route reject"
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
  if [ -n "$2" -a -n "$3" ];then
    if [ -n "$4" ];then
      vtysh -c "conf t" -c "no ip route $2/$3 $4 "
       if [ $? -eq 0 ];then
          echo "deleted ip route gateway "
       else
          >&2 echo "Error : Failed deleted ip route gateway  "
          exit 1
       fi
    fi
    if [ -n "$5" ];then
      vtysh -c "conf t" -c "no ip route $2/$3 $5"
        if [ $? -eq 0 ];then
           echo "deleted ip route interface gateway "
        else
           >&2 echo "Error : Failed deleted ip route interface gateway"
           exit 1
        fi
    fi
    if [[ $6 == "False" ]];then
      vtysh -c "conf t" -c "no ip route $2/$3 Null0"
       if [ $? -eq 0 ];then
          echo "deleted ip route Null0 "
       else
          >&2 echo "Error : Failed deleted ip route Null0"
          exit 1
       fi
    fi
    if [[ $7 == "False" ]];then
      vtysh -c "conf t" -c "no ip route $2/$3 reject"
       if [ $? -eq 0 ];then
          echo "deleted ip route reject "
       else
          >&2 echo "Error : Failed deleted ip route reject"
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
fi
