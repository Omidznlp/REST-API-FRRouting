#!/bin/sh
 ###### Method POST ######
if [[ $1 == "post" ]] ;then
  if [ -n "$4" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "area $3 nss" -c "area $3 nss $4"
    if [ $? -eq 0 ] ; then
       echo "set : nss ..."
    else
       >&2 echo "Error: Failed set : nss"
       exit 1
    fi
  fi
  if [[ $5 == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "area $3 stub"
     if [ $? -eq 0 ] ; then
        echo "set : stub ..."
     else
        >&2 echo "Error: Failed set :  stub"
        exit 1
     fi
  fi
  if [[ $6 == "true" ]];then
     vtysh -c "conf t"  -c "router ospf $2" -c "area $3 stub no-summary"
      if [ $? -eq 0 ] ; then
         echo "set : stub no-summary ..."
      else
         >&2 echo "Error: Failed set :  stub no-summary"
         exit 1
      fi
  fi
  if [ -n "$7" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "area $3 default-cost $7"
    if [ $? -eq 0 ] ; then
       echo "set : default-cost ..."
    else
       >&2 echo "Error: Failed set :  default-cost"
       exit 1
    fi
  fi
  if [[ $8 == "true" ]];then
     vtysh -c "conf t"  -c "router ospf $2" -c "area $3 authentication"
      if [ $? -eq 0 ] ; then
         echo "set :authentication ..."
      else
         >&2 echo "Error: Failed set : authentication"
         exit 1
      fi
    fi
    if [[ $9 == "true" ]];then
     vtysh -c "conf t"  -c "router ospf $2" -c "area $3 authentication message-digest"
      if [ $? -eq 0 ] ; then
         echo "set : message-digest ..."
      else
         >&2 echo "Error: Failed set :  message-digest"
         exit 1
      fi
    fi
  if [ -n "${10}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "area $3  virtual-link ${10}"
    if [ $? -eq 0 ] ; then
       echo "set : virtual-link  ..."
    else
       >&2 echo "Error: Failed set :  virtual-link "
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
 ###### Method PUT ######
elif [[ $1 == "put" ]]; then
  if [ -n "$4" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "area $3 nss $4"
    if [ $? -eq 0 ] ; then
       echo "set : nss ..."
    else
       >&2 echo "Error: Failed set : nss"
       exit 1
    fi
  fi
  if [[ $5 == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "area $3 stub"
      if [ $? -eq 0 ] ; then
         echo "set : stub ..."
      else
         >&2 echo "Error: Failed set : stub"
         exit 1
      fi
  elif [[ $5 == "false" ]]; then
        vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 stub"
      if [ $? -eq 0 ] ; then
         echo "delete : stub ..."
      else
         >&2 echo "Error: Failed delete : stub"
         exit 1
      fi
  fi
  if [[ $6 == "true" ]];then
     vtysh -c "conf t"  -c "router ospf $2" -c "area $3 stub no-summary"
      if [ $? -eq 0 ];then
         echo "set : stub no-summary ..."
      else
         >&2 echo "Error: Failed set :  stub no-summary"
         exit 1
      fi
  elif [[ $6 == "false" ]]; then
     vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 stub no-summary"
      if [ $? -eq 0 ];then
         echo "delete : stub no-summary ..."
      else
         >&2 echo "Error: Failed delete :  stub no-summary"
         exit 1
      fi
  fi
  if [ -n "$7" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "area $3 default-cost $7"
     if [ $? -eq 0 ];then
        echo "set : default-cost ..."
     else
        >&2 echo "Error: Failed set :  default-cost"
     exit 1
    fi
  fi
  if [[ $8 == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "area $3 authentication"
      if [ $? -eq 0 ] ; then
         echo " set : authentication ..."
      else
         >&2 echo " Error: Failed set :  authentication"
         exit 1
      fi
  fi
  if [[ $8 == "false" ]]; then
    vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 authentication"
      if [ $? -eq 0 ] ; then
         echo "delete : authentication ..."
      else
         >&2 echo "Error: Failed delete :  authentication"
         exit 1
      fi
  fi
  if [[ $9 == "true" ]];then
     vtysh -c "conf t"  -c "router ospf $2" -c "area $3 authentication message-digest"
      if [ $? -eq 0 ] ; then
         echo "set :  authentication message-digest ..."
      else
         >&2 echo "Error: Failed set :  authentication message-digest"
         exit 1
      fi
  elif [[ $9 == "false" ]]; then
     vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 authentication message-digest"
      if [ $? -eq 0 ] ; then
         echo "delete :  authentication message-digest ..."
      else
         >&2 echo "Error: Failed delete :  authentication message-digest"
         exit 1
      fi
  fi
  if [ -n "${10}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "area $3  virtual-link ${10}"
    if [ $? -eq 0 ] ; then
       echo "set : virtual-link   ..."
    else
       >&2 echo "Error: Failed set :  virtual-link  "
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
###### Method DELETE ######
elif [[ $1 == "delete" ]]; then
   vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 nss"
    if [ $? -eq 0 ] ; then
       echo "delete : nss ..."
    else
       >&2 echo "Error: Failed delete : nss"
       exit 1
    fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 stub"
    if [ $? -eq 0 ] ; then
       echo "delete : stub ..."
    else
       >&2 echo "Error: Failed delete :  stub"
       exit 1
    fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 stub no-summary"
    if [ $? -eq 0 ] ; then
        echo "delete : stub no-summary ..."
    else
        >&2 echo "Error: Failed delete :  stub no-summary"
        exit 1
    fi
  if [ -n "$4" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 default-cost $4"
    if [ $? -eq 0 ] ; then
       echo "delete : default-cost ..."
    else
       >&2 echo "Error: Failed delete :  default-cost"
    fi
  fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 authentication"
    if [ $? -eq 0 ] ; then
        echo "delete :authentication ..."
    else
        >&2 echo "Error: Failed delete : authentication"
        exit 1
    fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no area $3 authentication message-digest"
    if [ $? -eq 0 ] ; then
        echo "set : message-digest ..."
    else
        >&2 echo "Error: Failed set :  message-digest"
        exit 1
    fi
  if [ -n "$5" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no area $3  virtual-link $5"
    if [ $? -eq 0 ] ; then
       echo "delete : virtual-link  ..."
    else
       >&2 echo "Error: Failed delete :  virtual-link "
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
