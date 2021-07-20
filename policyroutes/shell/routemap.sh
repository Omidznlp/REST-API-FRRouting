#!/bin/sh
if [[ $1 == "post" ]];then
   if [ -n "$2" -a -n "$3" -a -n "$4" ];then
     if [ -n "$5" ];then
       vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address $5"
          if [ $? -eq 0 ];then
             echo "set ip match ip address access-list number <1-200>"
          else
             >&2 echo "Error: Failed set ip match ip address access-list number <1-200>"
             exit 1
          fi
     fi
     if [ -n "$6" ];then
       vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address $6"
          if [ $? -eq 0 ];then
             echo "set ip match ip address access-list number <1300-2699>"
          else
             >&2 echo "Error: Failed set ip match ip address access-list number <1300-2699>"
             exit 1
          fi
     fi
     if [ -n "$7" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address prefix-len $7"
          if [ $? -eq 0 ];then
             echo "set  match ip address prefix-len"
          else
             >&2 echo "Error: Failed set  match ip address prefix-len"
             exit 1
          fi
     fi
     if [ -n "$8" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address prefix-list $8"
          if [ $? -eq 0 ];then
             echo "set match ip address prefix-list"
          else
             >&2 echo "Error: Failed set match ip address prefix-list"
             exit 1
          fi
     fi
     if [ -n "$9" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop $9"
          if [ $? -eq 0 ];then
             echo "set match ip nexthop <1-199>"
          else
             >&2 echo "Error: Failed set match ip nexthop <1-199>"
             exit 1
          fi
     fi
     if [ -n "${10}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop ${10}"
          if [ $? -eq 0 ];then
             echo "set match ip address nexthop access_list <1300-2699>"
          else
             >&2 echo "Error: Failed set match ip nexthop access_list <1300-2699>"
             exit 1
          fi
     fi
     if [ -n "${11}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop prefix-len ${11}"
          if [ $? -eq 0 ];then
             echo "set  match ip address prefix-len"
          else
             >&2 echo "Error: Failed set  match ip address prefix-len"
             exit 1
          fi
     fi
     if [ -n "${12}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop prefix-list ${12}"
          if [ $? -eq 0 ];then
             echo "set match ip prefix-list"
          else
             >&2 echo "Error: Failed set match ip prefix-list"
             exit 1
          fi
     fi
     if [ -n "${13}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match as-path ${13}"
          if [ $? -eq 0 ];then
             echo "set match as-path"
          else
             >&2 echo "Error: Failed set match as-path"
             exit 1
          fi
     fi
     if [ -n "${14}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match community ${14}"
          if [ $? -eq 0 ];then
             echo "set match community name"
          else
             >&2 echo "Error: Failed set match community name"
             exit 1
          fi
     fi
     if [ -n "${15}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match community ${15}"
          if [ $? -eq 0 ];then
             echo "set match community num-standard"
          else
             >&2 echo "Error: Failed set match community num-standard"
             exit 1
          fi
     fi
     if [ -n "${16}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match community ${16}"
          if [ $? -eq 0 ];then
             echo "set match community num-expanded"
          else
             >&2 echo "Error: Failed set match community num-expanded"
             exit 1
          fi
     fi
     if [ -n "${17}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match metric ${17}"
          if [ $? -eq 0 ];then
             echo "set match metric"
          else
             >&2 echo "Error: Failed set match metric"
             exit 1
          fi
     fi
     if [ -n "${18}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match tag ${18}"
          if [ $? -eq 0 ];then
             echo "set match tag"
          else
             >&2 echo "Error: Failed set match tag"
             exit 1
          fi
     fi
     if [ -n "${19}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match local-preference ${19}"
          if [ $? -eq 0 ];then
             echo "set match local-preference"
          else
             >&2 echo "Error: Failed set match local-preference"
             exit 1
          fi
     fi
     if [ -n "${20}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match peer ${20}"
          if [ $? -eq 0 ];then
             echo "set match peer ip"
          else
             >&2 echo "Error: Failed set match peer ip"
             exit 1
          fi
     fi
     if [ -n "${21}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match peer ${21}"
          if [ $? -eq 0 ];then
             echo "set match match peer interface"
          else
             >&2 echo "Error: Failed set match peer interface"
             exit 1
          fi
     fi
     if [ -n "${22}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match source-protocol ${22}"
          if [ $? -eq 0 ];then
             echo "set match source-protocol"
          else
             >&2 echo "Error: Failed set match source-protocol"
             exit 1
          fi
     fi
     if [ -n "${23}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match source-instance ${23}"
          if [ $? -eq 0 ];then
             echo "set match source-instance"
          else
             >&2 echo "Error: Failed set match source-instance"
             exit 1
          fi
     fi
     if [ -n "${24}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match origin ${24}"
          if [ $? -eq 0 ];then
             echo "set match origin"
          else
             >&2 echo "Error: Failed set match origin"
             exit 1
          fi
     fi
     if [ -n "${25}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set tag ${25}"
          if [ $? -eq 0 ];then
             echo "set tag"
          else
             >&2 echo "Error: Failed set tag"
             exit 1
          fi
     fi
     if [ -n "${26}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set ip next-hop ${26}"
          if [ $? -eq 0 ];then
             echo "set ip next-hop "
          else
             >&2 echo "Error: Failed ip next-hop "
             exit 1
          fi
     fi
     if [[ "${27}" == "True" ]];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set ip next-hop peer-address"
          if [ $? -eq 0 ];then
             echo "set ip next-hop peer-address"
          else
             >&2 echo "Error: Failed set ip next-hop peer-address"
             exit 1
          fi
     fi
     if [[ "${28}" == "True" ]];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set ip next-hop unchanged"
          if [ $? -eq 0 ];then
             echo "set ip next-hop unchanged"
          else
             >&2 echo "Error: Failed set ip next-hop unchanged"
             exit 1
          fi
     fi
     if [ -n "${29}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set local-preference ${29}"
          if [ $? -eq 0 ];then
             echo "set local-preference"
          else
             >&2 echo "Error: Failed set local-preference"
             exit 1
          fi
     fi
     if [ -n "${30}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set local-preference +${30}"
          if [ $? -eq 0 ];then
             echo "set local-preference add "
          else
             >&2 echo "Error: Failed set local-preference add"
             exit 1
          fi
     fi
     if [ -n "${31}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set local-preference -${31}"
          if [ $? -eq 0 ];then
             echo "set local-preference sub"
          else
             >&2 echo "Error: Failed set local-preference sub"
             exit 1
          fi
     fi
     if [ -n "${32}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set distance ${32}"
          if [ $? -eq 0 ];then
             echo "set distance"
          else
             >&2 echo "Error: Failed set distance"
             exit 1
          fi
     fi
     if [ -n "${33}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set as-path exclude ${33}"
          if [ $? -eq 0 ];then
             echo "set as-path exclude"
          else
             >&2 echo "Error: Failed set as-path exclude"
             exit 1
          fi
     fi
     if [ -n "${34}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set as-path prepend ${34}"
          if [ $? -eq 0 ];then
             echo "set as-path prepend"
          else
             >&2 echo "Error: Failed set as-path prepend"
             exit 1
          fi
     fi
     if [ -n "${35}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set community ${35}"
          if [ $? -eq 0 ];then
             echo "set community"
          else
             >&2 echo "Error: Failed set community"
             exit 1
          fi
     fi
     if [ -n "${36}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set metric ${36}"
          if [ $? -eq 0 ];then
             echo "set metric"
          else
             >&2 echo "Error: Failed set metric"
             exit 1
          fi
     fi
     if [ -n "${37}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set origin ${37}"
          if [ $? -eq 0 ];then
             echo "set origin"
          else
             >&2 echo "Error: Failed set origin"
             exit 1
          fi
     fi
     if [ -n "${38}" -a -n "${39}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set aggregator as ${38} ${39}"
          if [ $? -eq 0 ];then
             echo "set aggregator as AS number"
          else
             >&2 echo "Error: Failed set aggregator as AS number"
             exit 1
          fi
     fi
     if [ -n "${40}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "call ${40}"
          if [ $? -eq 0 ];then
             echo "set call"
          else
             >&2 echo "Error: Failed set call"
             exit 1
          fi
     fi
     if [ -n "${41}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "continue ${41}"
          if [ $? -eq 0 ];then
             echo "set continue"
          else
             >&2 echo "Error: Failed set continue"
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
   if [ -n "$2" -a -n "$3" -a -n "$4" ];then
     if [ -n "$5" ];then
       vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address $5"
          if [ $? -eq 0 ];then
             echo "set ip match ip address access-list number <1-200>"
          else
             >&2 echo "Error: Failed set ip match ip address access-list number <1-200>"
             exit 1
          fi
     fi
     if [ -n "$6" ];then
       vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address $6"
          if [ $? -eq 0 ];then
             echo "set ip match ip address access-list number <1300-2699>"
          else
             >&2 echo "Error: Failed set ip match ip address access-list number <1300-2699>"
             exit 1
          fi
     fi
     if [ -n "$7" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address prefix-len $7"
          if [ $? -eq 0 ];then
             echo "set  match ip address prefix-len"
          else
             >&2 echo "Error: Failed set  match ip address prefix-len"
             exit 1
          fi
     fi
     if [ -n "$8" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip address prefix-list $8"
          if [ $? -eq 0 ];then
             echo "set match ip address prefix-list"
          else
             >&2 echo "Error: Failed set match ip address prefix-list"
             exit 1
          fi
     fi
     if [ -n "$9" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop $9"
          if [ $? -eq 0 ];then
             echo "set match ip nexthop <1-199>"
          else
             >&2 echo "Error: Failed set match ip nexthop <1-199>"
             exit 1
          fi
     fi
     if [ -n "${10}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop ${10}"
          if [ $? -eq 0 ];then
             echo "set match ip address nexthop access_list <1300-2699>"
          else
             >&2 echo "Error: Failed set match ip nexthop access_list <1300-2699>"
             exit 1
          fi
     fi
     if [ -n "${11}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop prefix-len ${11}"
          if [ $? -eq 0 ];then
             echo "set  match ip address prefix-len"
          else
             >&2 echo "Error: Failed set  match ip address prefix-len"
             exit 1
          fi
     fi
     if [ -n "${12}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match ip next-hop prefix-list ${12}"
          if [ $? -eq 0 ];then
             echo "set match ip prefix-list"
          else
             >&2 echo "Error: Failed set match ip prefix-list"
             exit 1
          fi
     fi
     if [ -n "${13}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match as-path ${13}"
          if [ $? -eq 0 ];then
             echo "set match as-path"
          else
             >&2 echo "Error: Failed set match as-path"
             exit 1
          fi
     fi
     if [ -n "${14}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match community ${14}"
          if [ $? -eq 0 ];then
             echo "set match community name"
          else
             >&2 echo "Error: Failed set match community name"
             exit 1
          fi
     fi
     if [ -n "${15}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match community ${15}"
          if [ $? -eq 0 ];then
             echo "set match community num-standard"
          else
             >&2 echo "Error: Failed set match community num-standard"
             exit 1
          fi
     fi
     if [ -n "${16}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match community ${16}"
          if [ $? -eq 0 ];then
             echo "set match community num-expanded"
          else
             >&2 echo "Error: Failed set match community num-expanded"
             exit 1
          fi
     fi
     if [ -n "${17}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match metric ${17}"
          if [ $? -eq 0 ];then
             echo "set match metric"
          else
             >&2 echo "Error: Failed set match metric"
             exit 1
          fi
     fi
     if [ -n "${18}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match tag ${18}"
          if [ $? -eq 0 ];then
             echo "set match tag"
          else
             >&2 echo "Error: Failed set match tag"
             exit 1
          fi
     fi
     if [ -n "${19}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match local-preference ${19}"
          if [ $? -eq 0 ];then
             echo "set match local-preference"
          else
             >&2 echo "Error: Failed set match local-preference"
             exit 1
          fi
     fi
     if [ -n "${20}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match peer ${20}"
          if [ $? -eq 0 ];then
             echo "set match peer ip"
          else
             >&2 echo "Error: Failed set match peer ip"
             exit 1
          fi
     fi
     if [ -n "${21}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match peer ${21}"
          if [ $? -eq 0 ];then
             echo "set match match peer interface"
          else
             >&2 echo "Error: Failed set match peer interface"
             exit 1
          fi
     fi
     if [ -n "${22}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match source-protocol ${22}"
          if [ $? -eq 0 ];then
             echo "set match source-protocol"
          else
             >&2 echo "Error: Failed set match source-protocol"
             exit 1
          fi
     fi
     if [ -n "${23}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match source-instance ${23}"
          if [ $? -eq 0 ];then
             echo "set match source-instance"
          else
             >&2 echo "Error: Failed set match source-instance"
             exit 1
          fi
     fi
     if [ -n "${24}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "match origin ${24}"
          if [ $? -eq 0 ];then
             echo "set match origin"
          else
             >&2 echo "Error: Failed set match origin"
             exit 1
          fi
     fi
     if [ -n "${25}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set tag ${25}"
          if [ $? -eq 0 ];then
             echo "set tag"
          else
             >&2 echo "Error: Failed set tag"
             exit 1
          fi
     fi
     if [ -n "${26}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set ip next-hop ${26}"
          if [ $? -eq 0 ];then
             echo "set ip next-hop "
          else
             >&2 echo "Error: Failed ip next-hop "
             exit 1
          fi
     fi
     if [[ "${27}" == "True" ]];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set ip next-hop peer-address"
          if [ $? -eq 0 ];then
             echo "set ip next-hop peer-address"
          else
             >&2 echo "Error: Failed set ip next-hop peer-address"
             exit 1
          fi
     elif [[ "${27}" == "False" ]];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "no set ip next-hop peer-address"
          if [ $? -eq 0 ];then
             echo "set ip next-hop peer-address"
          else
             >&2 echo "Error: Failed set ip next-hop peer-address"
             exit 1
          fi
     fi
     if [[ "${28}" == "True" ]];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set ip next-hop unchanged"
          if [ $? -eq 0 ];then
             echo "set ip next-hop unchanged"
          else
             >&2 echo "Error: Failed set ip next-hop unchanged"
             exit 1
          fi
     elif [[ "${28}" == "False" ]];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "no set ip next-hop unchanged"
          if [ $? -eq 0 ];then
             echo "set ip next-hop unchanged"
          else
             >&2 echo "Error: Failed set ip next-hop unchanged"
             exit 1
          fi
     fi
     if [ -n "${29}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set local-preference ${29}"
          if [ $? -eq 0 ];then
             echo "set local-preference"
          else
             >&2 echo "Error: Failed set local-preference"
             exit 1
          fi
     fi
     if [ -n "${30}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set local-preference +${30}"
          if [ $? -eq 0 ];then
             echo "set local-preference add "
          else
             >&2 echo "Error: Failed set local-preference add"
             exit 1
          fi
     fi
     if [ -n "${31}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set local-preference -${31}"
          if [ $? -eq 0 ];then
             echo "set local-preference sub"
          else
             >&2 echo "Error: Failed set local-preference sub"
             exit 1
          fi
     fi
     if [ -n "${32}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set distance ${32}"
          if [ $? -eq 0 ];then
             echo "set distance"
          else
             >&2 echo "Error: Failed set distance"
             exit 1
          fi
     fi
     if [ -n "${33}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set as-path exclude ${33}"
          if [ $? -eq 0 ];then
             echo "set as-path exclude"
          else
             >&2 echo "Error: Failed set as-path exclude"
             exit 1
          fi
     fi
     if [ -n "${34}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set as-path prepend ${34}"
          if [ $? -eq 0 ];then
             echo "set as-path prepend"
          else
             >&2 echo "Error: Failed set as-path prepend"
             exit 1
          fi
     fi
     if [ -n "${35}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set community ${35}"
          if [ $? -eq 0 ];then
             echo "set community"
          else
             >&2 echo "Error: Failed set community"
             exit 1
          fi
     fi
     if [ -n "${36}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set metric ${36}"
          if [ $? -eq 0 ];then
             echo "set metric"
          else
             >&2 echo "Error: Failed set metric"
             exit 1
          fi
     fi
     if [ -n "${37}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set origin ${37}"
          if [ $? -eq 0 ];then
             echo "set origin"
          else
             >&2 echo "Error: Failed set origin"
             exit 1
          fi
     fi
     if [ -n "${38}" -a -n "${39}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "set aggregator as ${38} ${39}"
          if [ $? -eq 0 ];then
             echo "set aggregator as AS number"
          else
             >&2 echo "Error: Failed set aggregator as AS number"
             exit 1
          fi
     fi
     if [ -n "${40}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "call ${40}"
          if [ $? -eq 0 ];then
             echo "set call"
          else
             >&2 echo "Error: Failed set call"
             exit 1
          fi
     fi
     if [ -n "${41}" ];then
        vtysh -c "conf t" -c "route-map $3 $4 $2" -c "continue ${41}"
          if [ $? -eq 0 ];then
             echo "set continue"
          else
             >&2 echo "Error: Failed set continue"
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
   if [ -n "$2" ];then
     vtysh -c "conf t" -c "no route-map $2"
        if [ $? -eq 0 ];then
           echo "delete route-map"
        else
           >&2 echo "Error: Failed delete route-map"
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
