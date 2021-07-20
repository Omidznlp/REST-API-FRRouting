#!/bin/sh
 ###### Method POST ######
if [[ $1 == "post" ]] ;then
  if [ -n "$3" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "passive-interface $3"
    if [ $? -eq 0 ] ; then
       echo "set : passive-interface ..."
    else
       >&2 echo "Error: Failed set :  passive-interface"
       exit 1
    fi
  fi
  if [ -n "$4" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "redistribute $4"
    if [ $? -eq 0 ] ; then
       echo "set : redistribute  ..."
    else
       >&2 echo "Error: Failed set : nss"
       exit 1
    fi
  fi
  if [ -n "$5" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "default-metric $5"
    if [ $? -eq 0 ] ; then
       echo "set : default-metric..."
    else
       >&2 echo "Error: Failed set : default-metric"
       exit 1
    fi
  fi
  if [ -n "$6" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "timers lsa min-arrival $6"
     if [ $? -eq 0 ] ; then
        echo "set : lsa min-arrival ..."
     else
        >&2 echo "Error: Failed set : lsa min-arrival"
        exit 1
     fi
  fi
  if [ -n "$8"  -a  -n "$9" -a -n "${10}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "timers throttle spf $8 $9 ${10} "
     if [ $? -eq 0 ] ; then
        echo "set : timers throttle spf ..."
     else
        >&2 echo "Error: Failed set :  timers throttle spf"
        exit 1
     fi
  fi
  if [ -n "${11}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "ospf abr-type ${11}"
    if [ $? -eq 0 ] ; then
       echo "set :ospf abr-type  ..."
    else
       >&2 echo "Error: Failed set :  ospf abr-type "
       exit 1
    fi
  fi
  if [ -n "${12}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "max-metric router-lsa on-startup ${12}"
    if [ $? -eq 0 ];then
       echo "set : max-metric router-lsa on-startup  ..."
    else
       >&2 echo "Error: Failed set :  max-metric router-lsa on-startup "
       exit 1
    fi
  fi
  if [ -n "${13}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "max-metric router-lsa on-shutdown ${13}"
    if [ $? -eq 0 ];then
      echo "set :max-metric router-lsa on-shutdown  ..."
    else
      >&2 echo "Error: Failed set :  max-metric router-lsa on-shutdown "
      exit 1
    fi
  fi
  if [[ ${14} == "true" ]];then
   vtysh -c "conf t"  -c "router ospf $2" -c "max-metric router-lsa administrative"
    if [ $? -eq 0 ];then
       echo "set : max-metric router-lsa administrative  ..."
    else
       >&2 echo "Error: Failed set :  max-metric router-lsa administrative "
       exit 1
    fi
  fi
  if [ -n "${15}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "neighbor ${15}"
    if [ $? -eq 0 ] ; then
       echo "set : neighbor  ..."
    else
       >&2 echo "Error: Failed set :  neighbor "
       exit 1
    fi
  fi
  if [ -n "${15}" -a -n "${16}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "neighbor ${15} poll-interval ${16}"
    if [ $? -eq 0 ];then
       echo "set : neighbor poll-interval  ..."
    else
       >&2 echo "Error: Failed set : neighbor poll-interval "
       exit 1
    fi
  fi
  if [ -n "${15}" -a -n "${17}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "neighbor ${15} priority ${17} "
    if [ $? -eq 0 ] ; then
       echo "set : neighbor priority  ..."
    else
       >&2 echo "Error: Failed set :  neighbor priority "
       exit 1
    fi
  fi
  if [[ ${18} == "true" ]];then
   vtysh -c "conf t"  -c "router ospf $2" -c "ospf rfc1583compatibility"
    if [ $? -eq 0 ] ; then
      echo "set : ospf rfc1583compatibility  ..."
    else
      >&2 echo "Error: Failed set : ospf rfc1583compatibility "
      exit 1
    fi
  fi
  if [ -n "${19}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "auto-cost reference-bandwidth ${19}"
    if [ $? -eq 0 ];then
       echo "set : auto-cost reference-bandwidth  ..."
    else
       >&2 echo "Error: Failed set :  auto-cost reference-bandwidth "
       exit 1
    fi
  fi
  if [ -n "${20}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ${20}"
    if [ $? -eq 0 ] ; then
       echo "set : distance  ..."
    else
       >&2 echo "Error: Failed set :  distance "
       exit 1
    fi
  fi
  if [ -n "${21}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ospf inter-area ${21}"
    if [ $? -eq 0 ] ; then
       echo "set : distance ospf inter-area  ..."
    else
       >&2 echo "Error: Failed set :  distance ospf inter-area "
       exit 1
    fi
  fi
  if [ -n "${22}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ospf intra-area ${22}"
    if [ $? -eq 0 ] ; then
       echo "set : distance ospf intra-area   ..."
    else
       >&2 echo "Error: Failed set :  distance ospf intra-area  "
       exit 1
    fi
  fi
  if [ -n "${23}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ospf external ${23}"
    if [ $? -eq 0 ] ; then
       echo "set : distance ospf external  ..."
    else
       >&2 echo "Error: Failed set :  distance ospf external "
       exit 1
    fi
  fi
  if [[ ${24} == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate"
      if [ $? -eq 0 ] ; then
         echo "set : default-information originate ..."
      else
         >&2 echo "Error: Failed set :  default-information originate"
         exit 1
      fi
  fi
  if [[ ${25} == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate always"
      if [ $? -eq 0 ] ; then
         echo "set : default-information originate always ..."
      else
         >&2 echo "Error: Failed set :  default-information originate always"
         exit 1
      fi
  fi
  if [ -n "${26}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate metric ${26}"
      if [ $? -eq 0 ] ; then
         echo "set : default-information originate metric ..."
      else
         >&2 echo "Error: Failed set :  default-information originate metric"
         exit 1
      fi
  fi
  if [ -n "${27}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate metric-type ${27}"
      if [ $? -eq 0 ] ; then
         echo "set : default-information originate metric-type ..."
      else
         >&2 echo "Error: Failed set :  default-information originate metric-type"
         exit 1
      fi
    fi
  if [ -n "${28}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate route-map ${28}"
      if [ $? -eq 0 ] ; then
        echo "set : default-information originate route-map ..."
      else
        >&2 echo "Error: Failed set :  default-information originate route-map"
        exit 1
      fi
  fi
  if [[ ${29} == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "log-adjacency-changes"
      if [ $? -eq 0 ] ; then
         echo "set : log-adjacency-changes ..."
         exit 0
      else
         >&2 echo "Error: Failed set :  log-adjacency-changes"
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
elif [[ $1 == "put" ]] ;then
  if [ -n "$3" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no passive-interface $3"
    if [ $? -eq 0 ] ; then
       echo "delete : passive-interface ..."
    else
       >&2 echo "Error: Failed delete :  passive-interface"
    fi
  fi
  if [ -n "$4" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "redistribute $4"
    if [ $? -eq 0 ] ; then
       echo "update : redistribute  ..."
    else
       >&2 echo "Error: Failed update : nss"
       exit 1
    fi
  fi
  if [ -n "$5" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "default-metric $5"
    if [ $? -eq 0 ] ; then
       echo "update : default-metric..."
    else
       >&2 echo "Error: Failed update : default-metric"
       exit 1
    fi
  fi
  if [ -n "$6" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "timers lsa min-arrival $6"
     if [ $? -eq 0 ] ; then
        echo "update : lsa min-arrival ..."
     else
        >&2 echo "Error: Failed update : lsa min-arrival"
        exit 1
     fi
  fi
  if [ -n "$8"  -a  -n "$9" -a -n "${10}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "timers throttle spf $8 $9 ${10} "
     if [ $? -eq 0 ] ; then
        echo "update : timers throttle spf ..."
     else
        >&2 echo "Error: Failed update :  timers throttle spf"
        exit 1
     fi
  fi
  if [ -n "${11}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "ospf abr-type ${11}"
    if [ $? -eq 0 ] ; then
       echo "update :ospf abr-type  ..."
    else
       >&2 echo "Error: Failed update :  ospf abr-type "
       exit 1
    fi
  fi
  if [ -n "${12}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "max-metric router-lsa on-startup ${12}"
    if [ $? -eq 0 ];then
       echo "update : max-metric router-lsa on-startup  ..."
    else
       >&2 echo "Error: Failed update :  max-metric router-lsa on-startup "
       exit 1
    fi
  fi
  if [ -n "${13}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "max-metric router-lsa on-shutdown ${13}"
    if [ $? -eq 0 ];then
      echo "update :max-metric router-lsa on-shutdown  ..."
    else
      >&2 echo "Error: Failed update :  max-metric router-lsa on-shutdown "
      exit 1
    fi
  fi
  if [[ ${14} == "true" ]];then
   vtysh -c "conf t"  -c "router ospf $2" -c "max-metric router-lsa administrative"
    if [ $? -eq 0 ];then
       echo "update : max-metric router-lsa administrative  ..."
    else
       >&2 echo "Error: Failed update :  max-metric router-lsa administrative "
       exit 1
    fi
  elif [[ ${14} == "false" ]];then
       vtysh -c "conf t"  -c "router ospf $2" -c "no max-metric router-lsa administrative"
    if [ $? -eq 0 ];then
       echo "delete : max-metric router-lsa administrative  ..."
    else
       >&2 echo "Error: Failed delete :  max-metric router-lsa administrative "
       exit 1
    fi
  fi
  if [ -n "${15}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "neighbor ${15}"
    if [ $? -eq 0 ] ; then
       echo "update : neighbor  ..."
    else
       >&2 echo "Error: Failed update :  neighbor "
       exit 1
    fi
  fi
  if [ -n "${15}" -a -n "${16}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "neighbor ${15} poll-interval ${16}"
    if [ $? -eq 0 ];then
       echo "update : neighbor poll-interval  ..."
    else
       >&2 echo "Error: Failed update : neighbor poll-interval "
       exit 1
    fi
  fi
  if [ -n "${15}" -a -n "${17}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "neighbor ${15} priority ${17} "
    if [ $? -eq 0 ] ; then
       echo "update : neighbor priority  ..."
    else
       >&2 echo "Error: Failed update :  neighbor priority "
       exit 1
    fi
  fi
  if [[ ${18} == "true" ]];then
   vtysh -c "conf t"  -c "router ospf $2" -c "ospf rfc1583compatibility"
    if [ $? -eq 0 ] ; then
      echo "update : ospf rfc1583compatibility  ..."
    else
      >&2 echo "Error: Failed update : ospf rfc1583compatibility "
      exit 1
    fi
  elif [[ ${18} == "false" ]];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no ospf rfc1583compatibility"
    if [ $? -eq 0 ] ; then
      echo "delete : ospf rfc1583compatibility  ..."
    else
      >&2 echo "Error: Failed delete : ospf rfc1583compatibility "
      exit 1
    fi
  fi
  if [ -n "${19}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "auto-cost reference-bandwidth ${19}"
    if [ $? -eq 0 ];then
       echo "update : auto-cost reference-bandwidth  ..."
    else
       >&2 echo "Error: Failed update :  auto-cost reference-bandwidth "
       exit 1
    fi
  fi
  if [ -n "${20}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ${20}"
    if [ $? -eq 0 ] ; then
       echo "update : distance  ..."
    else
       >&2 echo "Error: Failed update :  distance "
       exit 1
    fi
  fi
  if [ -n "${21}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ospf inter-area ${21}"
    if [ $? -eq 0 ] ; then
       echo "update : distance ospf inter-area  ..."
    else
       >&2 echo "Error: Failed update :  distance ospf inter-area "
       exit 1
    fi
  fi
  if [ -n "${22}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ospf intra-area ${22}"
    if [ $? -eq 0 ] ; then
       echo "update : distance ospf intra-area   ..."
    else
       >&2 echo "Error: Failed update :  distance ospf intra-area  "
       exit 1
    fi
  fi
  if [ -n "${23}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "distance ospf external ${23}"
    if [ $? -eq 0 ] ; then
       echo "update : distance ospf external  ..."
    else
       >&2 echo "Error: Failed update :  distance ospf external "
       exit 1
    fi
  fi
  if [[ ${24} == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate"
      if [ $? -eq 0 ] ; then
         echo "update : default-information originate ..."
      else
         >&2 echo "Error: Failed update :  default-information originate"
         exit 1
      fi
  elif [[ ${24} == "false" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "no default-information originate"
      if [ $? -eq 0 ] ; then
         echo "delete : default-information originate ..."
      else
         >&2 echo "Error: Failed delete :  default-information originate"
         exit 1
      fi
  fi
  if [[ ${25} == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate always"
      if [ $? -eq 0 ] ; then
         echo "update : default-information originate always ..."
      else
         >&2 echo "Error: Failed update :  default-information originate always"
         exit 1
      fi
  elif [[ ${25} == "false" ]];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate always"
      if [ $? -eq 0 ] ; then
         echo "delete : default-information originate always ..."
      else
         >&2 echo "Error: Failed delete :  default-information originate always"
         exit 1
      fi
  fi
  if [ -n "${26}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate metric ${26}"
      if [ $? -eq 0 ] ; then
         echo "set : default-information originate metric ..."
      else
         >&2 echo "Error: Failed set :  default-information originate metric"
         exit 1
      fi
  fi
  if [ -n "${27}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate metric-type ${27}"
      if [ $? -eq 0 ] ; then
         echo "update : default-information originate metric-type ..."
      else
         >&2 echo "Error: Failed update :  default-information originate metric-type"
         exit 1
      fi
  fi
  if [ -n "${28}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "default-information originate route-map ${28}"
      if [ $? -eq 0 ] ; then
        echo "update : default-information originate route-map ..."
      else
        >&2 echo "Error: Failed update :  default-information originate route-map"
        exit 1
      fi
  fi
  if [[ ${29} == "true" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "log-adjacency-changes"
      if [ $? -eq 0 ] ; then
         echo "update : log-adjacency-changes ..."
         exit 0
      else
         >&2 echo "Error: Failed update :  log-adjacency-changes"
         exit 1
      fi
  elif [[ ${29} == "false" ]];then
    vtysh -c "conf t"  -c "router ospf $2" -c "log-adjacency-changes"
      if [ $? -eq 0 ] ; then
         echo "update : log-adjacency-changes ..."
      else
         >&2 echo "Error: Failed update :  log-adjacency-changes"
         exit 1
      fi
  fi
 ###### Method DELETE ######
elif [[ $1 == "delete" ]] ;then
  if [ -n "$3" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no passive-interface $3"
    if [ $? -eq 0 ] ; then
       echo "delete : passive-interface ..."
    else
       >&2 echo "Error: Failed delete :  passive-interface"
    fi
  fi
  if [ -n "$4" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no redistribute $4"
    if [ $? -eq 0 ] ; then
       echo "delete : redistribute  ..."
    else
       >&2 echo "Error: Failed delete : nss"
       exit 1
    fi
  fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no default-metric"
    if [ $? -eq 0 ] ; then
       echo "delete : default-metric..."
    else
       >&2 echo "Error: Failed delete : default-metric"
       exit 1
    fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no timers lsa min-arrival"
     if [ $? -eq 0 ] ; then
        echo "delete : lsa min-arrival ..."
     else
        >&2 echo "Error: Failed delete : lsa min-arrival"
        exit 1
     fi
  vtysh -c "conf t"  -c "router ospf $2" -c "no timers throttle spf"
     if [ $? -eq 0 ] ; then
        echo "delete : timers throttle spf ..."
     else
        >&2 echo "Error: Failed delete :  timers throttle spf"
        exit 1
     fi
  if [ -n "$5" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no ospf abr-type $5"
    if [ $? -eq 0 ] ; then
       echo "delete :ospf abr-type  ..."
    else
       >&2 echo "Error: Failed update :  delete abr-type "
       exit 1
    fi
  fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no max-metric router-lsa on-startup"
    if [ $? -eq 0 ];then
       echo "delete : max-metric router-lsa on-startup  ..."
    else
       >&2 echo "Error: Failed delete :  max-metric router-lsa on-startup "
       exit 1
    fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no max-metric router-lsa on-shutdown"
    if [ $? -eq 0 ];then
      echo "delete :max-metric router-lsa on-shutdown  ..."
    else
      >&2 echo "Error: Failed delete :  max-metric router-lsa on-shutdown "
      exit 1
    fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no max-metric router-lsa administrative"
    if [ $? -eq 0 ];then
       echo "delete : max-metric router-lsa administrative  ..."
    else
       >&2 echo "Error: Failed delete :  max-metric router-lsa administrative "
       exit 1
    fi
  if [ -n "$6" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no neighbor $6"
    if [ $? -eq 0 ] ; then
       echo "delete : neighbor  ..."
    else
       >&2 echo "Error: Failed delete :  neighbor "
       exit 1
    fi
  fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no ospf rfc1583compatibility"
    if [ $? -eq 0 ] ; then
      echo "delete : ospf rfc1583compatibility  ..."
    else
      >&2 echo "Error: Failed delete : ospf rfc1583compatibility "
      exit 1
    fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no auto-cost reference-bandwidth"
    if [ $? -eq 0 ];then
       echo "delete : auto-cost reference-bandwidth  ..."
    else
       >&2 echo "Error: Failed delete :  auto-cost reference-bandwidth "
       exit 1
    fi
  if [ -n "${7}" ];then
   vtysh -c "conf t"  -c "router ospf $2" -c "no distance ${7}"
    if [ $? -eq 0 ] ; then
       echo "delete : distance  ..."
    else
       >&2 echo "Error: Failed delete :  distance "
       exit 1
    fi
  fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no distance ospf inter-area"
    if [ $? -eq 0 ] ; then
       echo "delete : distance ospf inter-area  ..."
    else
       >&2 echo "Error: Failed delete :  distance ospf inter-area "
       exit 1
    fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no distance ospf intra-area"
    if [ $? -eq 0 ] ; then
       echo "delete : distance ospf intra-area   ..."
    else
       >&2 echo "Error: Failed delete :  distance ospf intra-area  "
       exit 1
    fi
   vtysh -c "conf t"  -c "router ospf $2" -c "no distance ospf external"
    if [ $? -eq 0 ] ; then
       echo "delete : distance ospf external  ..."
    else
       >&2 echo "Error: Failed delete :  distance ospf external "
       exit 1
    fi
    vtysh -c "conf t"  -c "router ospf $2" -c "no default-information originate"
      if [ $? -eq 0 ] ; then
         echo "delete : default-information originate ..."
      else
         >&2 echo "Error: Failed delete :  default-information originate"
         exit 1
      fi
    vtysh -c "conf t"  -c "router ospf $2" -c "no default-information originate always"
      if [ $? -eq 0 ] ; then
         echo "delete : default-information originate always ..."
      else
         >&2 echo "Error: Failed delete :  default-information originate always"
         exit 1
      fi
  if [ -n "$8" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "no default-information originate metric $8"
      if [ $? -eq 0 ] ; then
         echo "delete : default-information originate metric ..."
      else
         >&2 echo "Error: Failed delete :  default-information originate metric"
         exit 1
      fi
  fi
  if [ -n "$9" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "no default-information originate metric-type $9"
      if [ $? -eq 0 ] ; then
         echo "delete : default-information originate metric-type ..."
      else
         >&2 echo "Error: Failed delete :  default-information originate metric-type"
         exit 1
      fi
  fi
  if [ -n "${10}" ];then
     vtysh -c "conf t"  -c "router ospf $2" -c "no default-information originate route-map ${10}"
      if [ $? -eq 0 ] ; then
        echo "delete : default-information originate route-map ..."
      else
        >&2 echo "Error: Failed delete :  default-information originate route-map"
        exit 1
      fi
  fi
    vtysh -c "conf t"  -c "router ospf $2" -c "no log-adjacency-changes"
      if [ $? -eq 0 ] ; then
         echo "delete : log-adjacency-changes ..."
         exit 0
      else
         >&2 echo "Error: Failed delete :  log-adjacency-changes"
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
