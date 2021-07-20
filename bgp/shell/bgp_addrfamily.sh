#!/bin/sh
if [[ $1 == "post" ]];then
  if [ -n "$2" ];then
    if [ -z "$3" ];then
       if [ -n "$4" -a -n "$5" ];then
          if [ -z "$6" -a -z "$7" -a -z "$8" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 "
              if [ $? -eq 0 ];then
                 echo "set aggregate-address "
              else
                 >&2 echo "Error : Failed set aggregate-address"
                 exit 1
              fi
          elif [[  $6 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 as-set"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [ -n "$7" ];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 route-map $7"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [[ $8 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 summary-only"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          fi
       fi
       if [ -n "$9" -a -n "${10}" -a -n "${11}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "distance $9 ${10}/${11} "
           if [ $? -eq 0 ];then
              echo "set distance "
           else
              >&2 echo "Error : Failed set distance"
              exit 1
           fi
       fi
       if [ -n "${12}" -a -n "${13}" -a -n "${14}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "distance bgp ${12} ${13} ${14} "
           if [ $? -eq 0 ];then
              echo "set distance bgp"
           else
              >&2 echo "Error : Failed set distance bgp"
              exit 1
           fi
       fi
       if [ -n "${15}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "maximum-paths ${15} "
           if [ $? -eq 0 ];then
              echo "set maximum-path "
           else
              >&2 echo "Error : Failed set maximum-path "
              exit 1
           fi
       fi
       if [ -n "${16}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "maximum-paths ibgp ${16} "
           if [ $? -eq 0 ];then
              echo "set maximum-path ibgp"
           else
              >&2 echo "Error : Failed set maximum-path ibgp "
              exit 1
           fi
       fi
       if [ -n "${17}" -a -n "${18}" ];then
         if [ -z "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "network ${17}/${18} "
             if [ $? -eq 0 ];then
                echo "set network"
             else
                >&2 echo "Error : Failed set network "
                exit 1
             fi
         elif [ -n "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "network ${17}/${18} route-map ${19} "
             if [ $? -eq 0 ];then
                echo "set network route-map "
             else
                >&2 echo "Error : Failed set network route-map "
                exit 1
             fi
         fi
       fi
       if [ -n "${20}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "redistribute ${20} "
           if [ $? -eq 0 ];then
              echo "set redistribute"
           else
              >&2 echo "Error : Failed set redistribute "
              exit 1
           fi
       fi
       if [ -n "${21}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "setaddpath-tx-all-paths"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths "
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS "
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in"
             else
                >&2 echo "Error : Failed set allowas-in "
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin"
             else
                >&2 echo "Error : Failed set  allowas-in origin "
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute"
             else
                >&2 echo "Error : Failed set redistribute "
                exit 1
             fi
         fi
         if [[ ${28} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all"
             else
                >&2 echo "Error : Failed set attribute-unchanged all "
                exit 1
             fi
         elif [ -z "${28}" ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med "
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop "
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med "
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path "
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med "
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop "
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map "
              else
                 >&2 echo "Error : Failed set default-originate route-map "
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list"
              else
                 >&2 echo "Error : Failed set prefix-list"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map"
              else
                 >&2 echo "Error : Failed set route-map"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
           if [[ ${41} == "none" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
                if [ $? -eq 0 ];then
                   echo "set send-community"
                else
                   >&2 echo "Error : Failed set send-community"
                   exit 1
                fi
           elif [[ ${41} != "none" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
                if [ $? -eq 0 ];then
                   echo "set send-community"
                else
                   >&2 echo "Error : Failed set send-community"
                   exit 1
                fi
           fi
         fi
       elif [ -n "${22}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "setaddpath-tx-all-paths interface"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths interface"
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22}  addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS interface"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS interface"
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in interface"
             else
                >&2 echo "Error : Failed set allowas-in interface"
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin interface"
             else
                >&2 echo "Error : Failed set  allowas-in origin interface"
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute interface"
             else
                >&2 echo "Error : Failed set redistribute interface "
                exit 1
             fi
         fi
         if [[ "${28}" == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all interface"
             else
                >&2 echo "Error : Failed set attribute-unchanged all interface"
                exit 1
             fi
         elif [ -z ${28} ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med interface"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med interface"
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map interface"
              else
                 >&2 echo "Error : Failed set default-originate route-map interface"
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface"
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface  "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list interface "
              else
                 >&2 echo "Error : Failed set prefix-list interface"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map interface"
              else
                 >&2 echo "Error : Failed set route-map interface"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} send-community ${41}"
              if [ $? -eq 0 ];then
                 echo "set send-community interface"
              else
                 >&2 echo "Error : Failed set send-community interface"
                 exit 1
              fi
         fi
       fi
    elif [ -n "$3" ];then
       if [ -n "$4" -a -n "$5" ];then
          if [ -z "$6" -a -z "$7" -a -z "$8" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 "
              if [ $? -eq 0 ];then
                 echo "set aggregate-address "
              else
                 >&2 echo "Error : Failed set aggregate-address"
                 exit 1
              fi
          elif [[  $6 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 as-set"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [ -n "$7" ];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 route-map $7"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [[ $8 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 summary-only"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          fi
       fi
       if [ -n "$9" -a -n "${10}" -a -n "${11}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "distance $9 ${10}/${11} "
           if [ $? -eq 0 ];then
              echo "set distance "
           else
              >&2 echo "Error : Failed set distance"
              exit 1
           fi
       fi
       if [ -n "${12}" -a -n "${13}" -a -n "${14}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "distance bgp ${12} ${13} ${14} "
           if [ $? -eq 0 ];then
              echo "set distance bgp"
           else
              >&2 echo "Error : Failed set distance bgp"
              exit 1
           fi
       fi
       if [ -n "${15}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "maximum-paths ${15} "
           if [ $? -eq 0 ];then
              echo "set maximum-path "
           else
              >&2 echo "Error : Failed set maximum-path "
              exit 1
           fi
       fi
       if [ -n "${16}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "maximum-paths ibgp ${16} "
           if [ $? -eq 0 ];then
              echo "set maximum-path ibgp"
           else
              >&2 echo "Error : Failed set maximum-path ibgp "
              exit 1
           fi
       fi
       if [ -n "${17}" -a -n "${18}" ];then
         if [ -z "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "network ${17}/${18} "
             if [ $? -eq 0 ];then
                echo "set network"
             else
                >&2 echo "Error : Failed set network "
                exit 1
             fi
         elif [ -n "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "network ${17}/${18} route-map ${19} "
             if [ $? -eq 0 ];then
                echo "set network route-map "
             else
                >&2 echo "Error : Failed set network route-map "
                exit 1
             fi
         fi
       fi
       if [ -n "${20}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "redistribute ${20} "
           if [ $? -eq 0 ];then
              echo "set redistribute"
           else
              >&2 echo "Error : Failed set redistribute "
              exit 1
           fi
       fi
       if [ -n "${21}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-all-paths"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths "
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS "
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in"
             else
                >&2 echo "Error : Failed set allowas-in "
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin"
             else
                >&2 echo "Error : Failed set  allowas-in origin "
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute"
             else
                >&2 echo "Error : Failed set redistribute "
                exit 1
             fi
         fi
         if [[ ${28} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all"
             else
                >&2 echo "Error : Failed set attribute-unchanged all "
                exit 1
             fi
         elif [ -z "${28}" ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med "
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop "
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med "
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path "
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med "
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop "
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map "
              else
                 >&2 echo "Error : Failed set default-originate route-map "
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list"
              else
                 >&2 echo "Error : Failed set prefix-list"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map"
              else
                 >&2 echo "Error : Failed set route-map"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} send-community ${41}"
              if [ $? -eq 0 ];then
                 echo "set send-community"
              else
                 >&2 echo "Error : Failed set send-community"
                 exit 1
              fi
         fi
       elif [ -n "${22}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "setaddpath-tx-all-paths interface"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths interface"
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22}  addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS interface"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS interface"
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in interface"
             else
                >&2 echo "Error : Failed set allowas-in interface"
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin interface"
             else
                >&2 echo "Error : Failed set  allowas-in origin interface"
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute interface"
             else
                >&2 echo "Error : Failed set redistribute interface "
                exit 1
             fi
         fi
         if [[ "${28}" == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all interface"
             else
                >&2 echo "Error : Failed set attribute-unchanged all interface"
                exit 1
             fi
         elif [ -z ${28} ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med interface"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4$3" -c "neighbor ${22} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med interface"
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map interface"
              else
                 >&2 echo "Error : Failed set default-originate route-map interface"
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface"
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface  "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list interface "
              else
                 >&2 echo "Error : Failed set prefix-list interface"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map interface"
              else
                 >&2 echo "Error : Failed set route-map interface"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
           if [[ ${41} == "none" ]];then
             vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
               if [ $? -eq 0 ];then
                  echo "set send-community"
               else
                  >&2 echo "Error : Failed set send-community"
                  exit 1
               fi
           elif [[ ${41} != "none" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
                 if [ $? -eq 0 ];then
                    echo "set send-community"
                 else
                    >&2 echo "Error : Failed set send-community"
                    exit 1
                 fi
           fi
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
    if [ -z "$3" ];then
       if [ -n "$4" -a -n "$5" ];then
          if [ -z "$6" -a -z "$7" -a -z "$8" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 "
              if [ $? -eq 0 ];then
                 echo "set aggregate-address "
              else
                 >&2 echo "Error : Failed set aggregate-address"
                 exit 1
              fi
          elif [[  $6 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 as-set"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [ -n "$7" ];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 route-map $7"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [[ $8 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "aggregate-address $4/$5 summary-only"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          fi
       fi
       if [ -n "$9" -a -n "${10}" -a -n "${11}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "distance $9 ${10}/${11} "
           if [ $? -eq 0 ];then
              echo "set distance "
           else
              >&2 echo "Error : Failed set distance"
              exit 1
           fi
       fi
       if [ -n "${12}" -a -n "${13}" -a -n "${14}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "distance bgp ${12} ${13} ${14} "
           if [ $? -eq 0 ];then
              echo "set distance bgp"
           else
              >&2 echo "Error : Failed set distance bgp"
              exit 1
           fi
       fi
       if [ -n "${15}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "maximum-paths ${15} "
           if [ $? -eq 0 ];then
              echo "set maximum-path "
           else
              >&2 echo "Error : Failed set maximum-path "
              exit 1
           fi
       fi
       if [ -n "${16}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "maximum-paths ibgp ${16} "
           if [ $? -eq 0 ];then
              echo "set maximum-path ibgp"
           else
              >&2 echo "Error : Failed set maximum-path ibgp "
              exit 1
           fi
       fi
       if [ -n "${17}" -a -n "${18}" ];then
         if [ -z "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "network ${17}/${18} "
             if [ $? -eq 0 ];then
                echo "set network"
             else
                >&2 echo "Error : Failed set network "
                exit 1
             fi
         elif [ -n "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "network ${17}/${18} route-map ${19} "
             if [ $? -eq 0 ];then
                echo "set network route-map "
             else
                >&2 echo "Error : Failed set network route-map "
                exit 1
             fi
         fi
       fi
       if [ -n "${20}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "redistribute ${20} "
           if [ $? -eq 0 ];then
              echo "set redistribute"
           else
              >&2 echo "Error : Failed set redistribute "
              exit 1
           fi
       fi
       if [ -n "${21}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "setaddpath-tx-all-paths"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths "
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS "
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in"
             else
                >&2 echo "Error : Failed set allowas-in "
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin"
             else
                >&2 echo "Error : Failed set  allowas-in origin "
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute"
             else
                >&2 echo "Error : Failed set redistribute "
                exit 1
             fi
         fi
         if [[ ${28} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all"
             else
                >&2 echo "Error : Failed set attribute-unchanged all "
                exit 1
             fi
         elif [ -z "${28}" ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med "
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop "
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med "
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path "
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med "
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop "
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map "
              else
                 >&2 echo "Error : Failed set default-originate route-map "
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list"
              else
                 >&2 echo "Error : Failed set prefix-list"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map"
              else
                 >&2 echo "Error : Failed set route-map"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
           if [[ ${41} == "none" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
                if [ $? -eq 0 ];then
                   echo "set send-community"
                else
                   >&2 echo "Error : Failed set send-community"
                   exit 1
                fi
           elif [[ ${41} != "none" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
                if [ $? -eq 0 ];then
                   echo "set send-community"
                else
                   >&2 echo "Error : Failed set send-community"
                   exit 1
                fi
           fi
         fi
       elif [ -n "${22}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "setaddpath-tx-all-paths interface"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths interface"
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22}  addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS interface"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS interface"
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in interface"
             else
                >&2 echo "Error : Failed set allowas-in interface"
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin interface"
             else
                >&2 echo "Error : Failed set  allowas-in origin interface"
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute interface"
             else
                >&2 echo "Error : Failed set redistribute interface "
                exit 1
             fi
         fi
         if [[ "${28}" == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all interface"
             else
                >&2 echo "Error : Failed set attribute-unchanged all interface"
                exit 1
             fi
         elif [ -z ${28} ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med interface"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med interface"
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map interface"
              else
                 >&2 echo "Error : Failed set default-originate route-map interface"
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface"
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface  "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list interface "
              else
                 >&2 echo "Error : Failed set prefix-list interface"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map interface"
              else
                 >&2 echo "Error : Failed set route-map interface"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${22} send-community ${41}"
              if [ $? -eq 0 ];then
                 echo "set send-community interface"
              else
                 >&2 echo "Error : Failed set send-community interface"
                 exit 1
              fi
         fi
       fi
    elif [ -n "$3" ];then
       if [ -n "$4" -a -n "$5" ];then
          if [ -z "$6" -a -z "$7" -a -z "$8" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 "
              if [ $? -eq 0 ];then
                 echo "set aggregate-address "
              else
                 >&2 echo "Error : Failed set aggregate-address"
                 exit 1
              fi
          elif [[  $6 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 as-set"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [ -n "$7" ];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 route-map $7"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          elif [[ $8 == "True" ]];then
              vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "aggregate-address $4/$5 summary-only"
                if [ $? -eq 0 ];then
                   echo "set aggregate-address "
                else
                   >&2 echo "Error : Failed set aggregate-address"
                   exit 1
                fi
          fi
       fi
       if [ -n "$9" -a -n "${10}" -a -n "${11}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "distance $9 ${10}/${11} "
           if [ $? -eq 0 ];then
              echo "set distance "
           else
              >&2 echo "Error : Failed set distance"
              exit 1
           fi
       fi
       if [ -n "${12}" -a -n "${13}" -a -n "${14}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "distance bgp ${12} ${13} ${14} "
           if [ $? -eq 0 ];then
              echo "set distance bgp"
           else
              >&2 echo "Error : Failed set distance bgp"
              exit 1
           fi
       fi
       if [ -n "${15}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "maximum-paths ${15} "
           if [ $? -eq 0 ];then
              echo "set maximum-path "
           else
              >&2 echo "Error : Failed set maximum-path "
              exit 1
           fi
       fi
       if [ -n "${16}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "maximum-paths ibgp ${16} "
           if [ $? -eq 0 ];then
              echo "set maximum-path ibgp"
           else
              >&2 echo "Error : Failed set maximum-path ibgp "
              exit 1
           fi
       fi
       if [ -n "${17}" -a -n "${18}" ];then
         if [ -z "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "network ${17}/${18} "
             if [ $? -eq 0 ];then
                echo "set network"
             else
                >&2 echo "Error : Failed set network "
                exit 1
             fi
         elif [ -n "${19}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "network ${17}/${18} route-map ${19} "
             if [ $? -eq 0 ];then
                echo "set network route-map "
             else
                >&2 echo "Error : Failed set network route-map "
                exit 1
             fi
         fi
       fi
       if [ -n "${20}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "redistribute ${20} "
           if [ $? -eq 0 ];then
              echo "set redistribute"
           else
              >&2 echo "Error : Failed set redistribute "
              exit 1
           fi
       fi
       if [ -n "${21}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-all-paths"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths "
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS "
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in"
             else
                >&2 echo "Error : Failed set allowas-in "
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin"
             else
                >&2 echo "Error : Failed set  allowas-in origin "
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute"
             else
                >&2 echo "Error : Failed set redistribute "
                exit 1
             fi
         fi
         if [[ ${28} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all"
             else
                >&2 echo "Error : Failed set attribute-unchanged all "
                exit 1
             fi
         elif [ -z "${28}" ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med "
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop "
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med "
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path "
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med "
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop "
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop "
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map "
              else
                 >&2 echo "Error : Failed set default-originate route-map "
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list"
              else
                 >&2 echo "Error : Failed set prefix-list"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map"
              else
                 >&2 echo "Error : Failed set route-map"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${21} send-community ${41}"
              if [ $? -eq 0 ];then
                 echo "set send-community"
              else
                 >&2 echo "Error : Failed set send-community"
                 exit 1
              fi
         fi
       elif [ -n "${22}" ];then
         if [[ ${23} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} addpath-tx-all-paths"
             if [ $? -eq 0 ];then
                echo "setaddpath-tx-all-paths interface"
             else
                >&2 echo "Error : Failed set addpath-tx-all-paths interface"
                exit 1
             fi
         elif [[ ${24} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22}  addpath-tx-bestpath-per-AS"
             if [ $? -eq 0 ];then
                echo "set addpath-tx-bestpath-per-AS interface"
             else
                >&2 echo "Error : Failed set addpath-tx-bestpath-per-AS interface"
                exit 1
             fi
         fi
         if [[ ${25} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} allowas-in"
             if [ $? -eq 0 ];then
                echo "set allowas-in interface"
             else
                >&2 echo "Error : Failed set allowas-in interface"
                exit 1
             fi
         elif [[ ${26} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} allowas-in origin"
             if [ $? -eq 0 ];then
                echo "set  allowas-in origin interface"
             else
                >&2 echo "Error : Failed set  allowas-in origin interface"
                exit 1
             fi
         fi
         if [[ ${27} == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} as-override"
             if [ $? -eq 0 ];then
                echo "set redistribute interface"
             else
                >&2 echo "Error : Failed set redistribute interface "
                exit 1
             fi
         fi
         if [[ "${28}" == "True" ]];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged"
             if [ $? -eq 0 ];then
                echo "set attribute-unchanged all interface"
             else
                >&2 echo "Error : Failed set attribute-unchanged all interface"
                exit 1
             fi
         elif [ -z ${28} ];then
             if [[ ${29} == "True" && ${30} == "True" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged as-path med"
                 if [ $? -eq 0 ];then
                    echo "set attribute-unchanged as-path med interface"
                 else
                    >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                    exit 1
                 fi
             elif [[ ${29} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged as-path next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path next-hop interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" && ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged med next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path med interface"
                      exit 1
                   fi
             elif [[ ${29} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged as-path"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged as-path interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged as-path interface"
                      exit 1
                   fi
             elif [[ ${30} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4$3" -c "neighbor ${22} attribute-unchanged med"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged med interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged med interface"
                      exit 1
                   fi
             elif [[ ${31} == "True" ]];then
                 vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} attribute-unchanged next-hop"
                   if [ $? -eq 0 ];then
                      echo "set attribute-unchanged next-hop interface"
                   else
                      >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                      exit 1
                   fi
             fi
         fi
         if [ -n "${33}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} default-originate route-map ${33} "
              if [ $? -eq 0 ];then
                 echo "set default-originate route-map interface"
              else
                 >&2 echo "Error : Failed set default-originate route-map interface"
                 exit 1
              fi
         elif [[ ${32} == "True" ]];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} default-originate"
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface"
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         fi
         if [ -n "${34}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} distribute-list ${34} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface"
                 exit 1
              fi
         elif [ -n "${35}" -a -n "${36}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} distribute-list ${35} ${36} "
              if [ $? -eq 0 ];then
                 echo "set attribute-unchanged next-hop interface  "
              else
                 >&2 echo "Error : Failed set attribute-unchanged next-hop interface "
                 exit 1
              fi
         fi
         if [ -n "${37}" -a -n "${38}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} prefix-list ${37} ${38}"
              if [ $? -eq 0 ];then
                 echo "set prefix-list interface "
              else
                 >&2 echo "Error : Failed set prefix-list interface"
                 exit 1
              fi
         fi
         if [ -n "${39}" -a -n "${40}" ];then
            vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "neighbor ${22} route-map ${39} ${40}"
              if [ $? -eq 0 ];then
                 echo "set route-map interface"
              else
                 >&2 echo "Error : Failed set route-map interface"
                 exit 1
              fi
         fi
         if [ -n "${41}" ];then
           if [[ ${41} == "none" ]];then
             vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
               if [ $? -eq 0 ];then
                  echo "set send-community"
               else
                  >&2 echo "Error : Failed set send-community"
                  exit 1
               fi
           elif [[ ${41} != "none" ]];then
               vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "neighbor ${21} send-community ${41}"
                 if [ $? -eq 0 ];then
                    echo "set send-community"
                 else
                    >&2 echo "Error : Failed set send-community"
                    exit 1
                 fi
           fi
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
  if [ -n "$2" ];then
    if [ -z "$3" ];then
       if [ -n "$4" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no aggregate-address $4/$5 "
           if [ $? -eq 0 ];then
               echo "delete aggregate-address "
           else
              >&2 echo "Error : Failed delete aggregate-address"
              exit 1
           fi
       fi
       if [ -n "$6" -a -n "$7" -a -n "$8" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no distance $6 ${7}/${8} "
           if [ $? -eq 0 ];then
              echo "delete distance "
           else
              >&2 echo "Error : Failed delete distance"
              exit 1
           fi
       fi
       if [ -n "${9}" -a -n "${10}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no network ${9}/${10} "
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
              exit 1
           fi
       fi
       if [ -n "${11}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no redistribute ${11} "
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
              exit 1
           fi
       fi
       if [ -n "${12}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no neighbor ${12} "
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
              exit 1
           fi
       elif [ -n "${13}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no neighbor ${13} "
             if [ $? -eq 0 ];then
                echo "delete network"
             else
                >&2 echo "Error : Failed detete network "
                exit 1
             fi
       fi
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4" -c "no distance bgp " -c "no maximum-paths " -c "no maximum-paths ibgp"
           if [ $? -eq 0 ];then
              echo "delete all"
           else
              >&2 echo "Error : Failed detete all "
              exit 1
           fi
    elif [ -n "$3" ];then
        if [ -n "$4" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no aggregate-address $4/$5 "
           if [ $? -eq 0 ];then
               echo "delete aggregate-address "
           else
              >&2 echo "Error : Failed delete aggregate-address"
              exit 1
           fi
       fi
       if [ -n "$6" -a -n "$7" -a -n "$8" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no distance $6 ${7}/${8} "
           if [ $? -eq 0 ];then
              echo "delete distance "
           else
              >&2 echo "Error : Failed delete distance"
              exit 1
           fi
       fi
       if [ -n "${9}" -a -n "${10}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no network ${9}/${10} "
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
              exit 1
           fi
       fi
       if [ -n "${11}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no redistribute ${11} "
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
              exit 1
           fi
       fi
       if [ -n "${12}" ];then
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no neighbor ${12} "
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
              exit 1
           fi
       elif [ -n "${13}" ];then
           vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no neighbor ${13} "
             if [ $? -eq 0 ];then
                echo "delete network"
             else
                >&2 echo "Error : Failed detete network "
                exit 1
             fi
       fi
         vtysh -c "conf t" -c "router bgp $2" -c "address-family ipv4 $3" -c "no distance bgp " -c "no maximum-paths " -c "no maximum-paths ibgp"
           if [ $? -eq 0 ];then
              echo "delete network"
           else
              >&2 echo "Error : Failed detete network "
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
fi
