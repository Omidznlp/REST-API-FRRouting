#!/bin/sh
if [[ $1 == "post" ]];then
   if [ -n "$3" -o -n "$4" ];then
     if [ -n "$3" ];then
       if [ -n "$8" -a "$9" ];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 $8/$9"
           if [ $? -eq 0 ];then
              echo "set access-list ip/prefix"
           else
              >&2 echo "Error: Failed set access-ist ip/prefix"
              exit 1
           fi
       elif [ -n "$8" ];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 $8"
           if [ $? -eq 0 ];then
              echo "set access-list ip"
           else
              >&2 echo "Error: Failed set access-ist ip"
              exit 1
           fi
       elif [[ ${10} == "True" ]];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 any"
           if [ $? -eq 0 ];then
              echo "set access-list any"
           else
              >&2 echo "Error: Failed set access-ist any"
              exit 1
           fi
       elif [ -n "${11}" ];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 host ${11}"
           if [ $? -eq 0 ];then
              echo "set access-list host"
           else
              >&2 echo "Error: Failed set access host"
              exit 1
           fi
       fi
     elif [ -n "$4" ];then
       if [ -n "$8" -a "$9" ];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 $8/$9"
           if [ $? -eq 0 ];then
              echo "set access-list ip/prefix"
           else
              >&2 echo "Error: Failed set access-ist ip/prefix"
              exit 1
           fi
       elif [ -n "$8" ];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 $8"
           if [ $? -eq 0 ];then
              echo "set access-list ip"
           else
              >&2 echo "Error: Failed set access-ist ip"
              exit 1
           fi
       elif [[ ${10} == "True" ]];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 any"
           if [ $? -eq 0 ];then
              echo "set access-list any"
           else
              >&2 echo "Error: Failed set access-ist any"
              exit 1
           fi
       elif [ -n "${11}" ];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 host ${11}"
           if [ $? -eq 0 ];then
              echo "set access-list host"
           else
              >&2 echo "Error: Failed set access host"
              exit 1
           fi
       fi
     fi
   elif [ -n "$5" -o -n "$6" ];then
       if [ -n "$5" ];then
         if [ -n "$8" -a "$9" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 $8/$9"
             if [ $? -eq 0 ];then
                echo "set access-list ip/prefix"
             else
                >&2 echo "Error: Failed set access-ist ip/prefix"
                exit 1
             fi
         elif [[ ${10} == "True" ]];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 any"
             if [ $? -eq 0 ];then
                echo "set access-list any"
             else
                >&2 echo "Error: Failed set access-ist any"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${14}" -a -n "${15}" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip ${12} ${13} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "set access-list ip ip_src wildcard ip_dst wildcard"
             else
                >&2 echo "Error: Failed set access-list ip ip_src wildcard ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" -a ${17} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip ${12} ${13} any "
               if [ $? -eq 0 ];then
                  echo "set access-list ip ip_src wildcard any_dst"
               else
                  >&2 echo "Error: Failed set access-list ip ip_src wildcard any_dst "
                  exit 1
               fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${19}" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip ${12} ${13} host ${19} "
               if [ $? -eq 0 ];then
                  echo "set access-list ip ip_src wildcard host host_dst"
               else
                  >&2 echo "Error: Failed set access-list ip ip_src wildcard host host_dst"
                  exit 1
               fi
         elif [ -n "${14}" -a -n "${15}" -a ${16} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip any ${14} ${15} "
               if [ $? -eq 0 ];then
                    echo "set access-list ip any_src ip_dst wildcard"
               else
                  >&2 echo "Error: Failed set access-list ip any_src ip_dst wildcard"
                  exit 1
               fi
         elif [[ ${16} == "True" && ${17} == "True" ]];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip any any "
             if [ $? -eq 0 ];then
                echo "set access-list ip any_src any_dst"
             else
                >&2 echo "Error: Failed set access-list ip any_src any_dst"
                exit 1
             fi
         elif [ -n "${19}" -a ${16} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip any host ${19} "
               if [ $? -eq 0 ];then
                  echo "set access-list ip any_src host_dst"
               else
                  >&2 echo "Error: Failed set access-list ip any_src host_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${14}" -a "${15}" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip host ${18} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "set access-list ip host_src ip_dst wildcard"
             else
                >&2 echo "Error: Failed set access-list ip host_src ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${18}" -a ${17} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip host ${18} any"
               if [ $? -eq 0 ];then
                  echo "set access-list ip host_src any_dst "
               else
                  >&2 echo "Error: Failed set access-list ip host_src any_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${19}" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip host ${18} host ${19}"
             if [ $? -eq 0 ];then
                echo "set access-list ip host_src host_dst"
             else
                >&2 echo "Error: Failed set access-list ip host_src host_dst"
                exit 1
             fi
         fi
       elif [ -n "$6" ];then
         if [ -n "$8" -a "$9" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 $8/$9"
             if [ $? -eq 0 ];then
                echo "set access-list ip/prefix"
             else
                >&2 echo "Error: Failed set access-ist ip/prefix"
                exit 1
             fi
         elif [[ ${10} == "True" ]];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 any"
             if [ $? -eq 0 ];then
                echo "set access-list any"
             else
                >&2 echo "Error: Failed set access-ist any"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${14}" -a -n "${15}" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip ${12} ${13} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "set access-list ip ip_src wildcard ip_dst wildcard"
             else
                >&2 echo "Error: Failed set access-list ip ip_src wildcard ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" ] && [[ ${17} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip ${12} ${13} any "
               if [ $? -eq 0 ];then
                  echo "set access-list ip ip_src wildcard any_dst"
               else
                  >&2 echo "Error: Failed set access-list ip ip_src wildcard any_dst "
                  exit 1
               fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${19}" ];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip ${12} ${13} host ${19} "
               if [ $? -eq 0 ];then
                  echo "set access-list ip ip_src wildcard host host_dst"
               else
                  >&2 echo "Error: Failed set access-list ip ip_src wildcard host host_dst"
                  exit 1
               fi
         elif [ -n "${14}" -a -n "${15}" ] && [[ ${16} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip any ${14} ${15} "
               if [ $? -eq 0 ];then
                    echo "set access-list ip any_src ip_dst wildcard"
               else
                  >&2 echo "Error: Failed set access-list ip any_src ip_dst wildcard"
                  exit 1
               fi
         elif [[ ${16} == "True" && ${17} == "True" ]];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip any any "
             if [ $? -eq 0 ];then
                echo "set access-list ip any_src any_dst"
             else
                >&2 echo "Error: Failed set access-list ip any_src any_dst"
                exit 1
             fi
         elif [ -n "${19}" ] && [[ ${16} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip any host ${19} "
               if [ $? -eq 0 ];then
                  echo "set access-list ip any_src host_dst"
               else
                  >&2 echo "Error: Failed set access-list ip any_src host_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${14}" -a "${15}" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip host ${18} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "set access-list ip host_src ip_dst wildcard"
             else
                >&2 echo "Error: Failed set access-list ip host_src ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${18}" ] && [[ ${17} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip host ${18} any"
               if [ $? -eq 0 ];then
                  echo "set access-list ip host_src any_dst "
               else
                  >&2 echo "Error: Failed set access-list ip host_src any_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${19}" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip host ${18} host ${19}"
             if [ $? -eq 0 ];then
                echo "set access-list ip host_src host_dst"
             else
                >&2 echo "Error: Failed set access-list ip host_src host_dst"
                exit 1
             fi
         fi
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
elif [[ $1 == "put" ]];then
   if [ -n "$3" -o -n "$4" ];then
     if [ -n "$3" ];then
       if [ -n "$8" -a "$9" ];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 $8/$9"
           if [ $? -eq 0 ];then
              echo "update access-list ip/prefix"
           else
              >&2 echo "Error: Failed update access-ist ip/prefix"
              exit 1
           fi
       elif [ -n "$8" ];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 $8"
           if [ $? -eq 0 ];then
              echo "update access-list ip"
           else
              >&2 echo "Error: Failed update access-ist ip"
              exit 1
           fi
       elif [[ ${10} == "True" ]];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 any"
           if [ $? -eq 0 ];then
              echo "update access-list any"
           else
              >&2 echo "Error: Failed update access-ist any"
              exit 1
           fi
       elif [ -n "${11}" ];then
         vtysh -c "conf t" -c "access-list $3 seq $2 $7 host ${11}"
           if [ $? -eq 0 ];then
              echo "update access-list host"
           else
              >&2 echo "Error: Failed update access host"
              exit 1
           fi
       fi
     elif [ -n "$4" ];then
       if [ -n "$8" -a "$9" ];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 $8/$9"
           if [ $? -eq 0 ];then
              echo "update access-list ip/prefix"
           else
              >&2 echo "Error: Failed update access-ist ip/prefix"
              exit 1
           fi
       elif [ -n "$8" ];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 $8"
           if [ $? -eq 0 ];then
              echo "update access-list ip"
           else
              >&2 echo "Error: Failed update access-ist ip"
              exit 1
           fi
       elif [[ ${10} == "True" ]];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 any"
           if [ $? -eq 0 ];then
              echo "update access-list any"
           else
              >&2 echo "Error: Failed update access-ist any"
              exit 1
           fi
       elif [ -n "${11}" ];then
         vtysh -c "conf t" -c "access-list $4 seq $2 $7 host ${11}"
           if [ $? -eq 0 ];then
              echo "update access-list host"
           else
              >&2 echo "Error: Failed update access host"
              exit 1
           fi
       fi
     fi
   elif [ -n "$5" -o -n "$6" ];then
       if [ -n "$5" ];then
         if [ -n "$8" -a "$9" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 $8/$9"
             if [ $? -eq 0 ];then
                echo "update access-list ip/prefix"
             else
                >&2 echo "Error: Failed update access-ist ip/prefix"
                exit 1
             fi
         elif [[ ${10} == "True" ]];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 any"
             if [ $? -eq 0 ];then
                echo "update access-list any"
             else
                >&2 echo "Error: Failed update access-ist any"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${14}" -a -n "${15}" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip ${12} ${13} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "update access-list ip ip_src wildcard ip_dst wildcard"
             else
                >&2 echo "Error: Failed update access-list ip ip_src wildcard ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" -a ${17} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip ${12} ${13} any "
               if [ $? -eq 0 ];then
                  echo "update access-list ip ip_src wildcard any_dst"
               else
                  >&2 echo "Error: Failed update access-list ip ip_src wildcard any_dst "
                  exit 1
               fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${19}" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip ${12} ${13} host ${19} "
               if [ $? -eq 0 ];then
                  echo "update access-list ip ip_src wildcard host host_dst"
               else
                  >&2 echo "Error: Failed update access-list ip ip_src wildcard host host_dst"
                  exit 1
               fi
         elif [ -n "${14}" -a -n "${15}" -a ${16} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip any ${14} ${15} "
               if [ $? -eq 0 ];then
                    echo "update access-list ip any_src ip_dst wildcard"
               else
                  >&2 echo "Error: Failed update access-list ip any_src ip_dst wildcard"
                  exit 1
               fi
         elif [[ ${16} == "True" && ${17} == "True" ]];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip any any "
             if [ $? -eq 0 ];then
                echo "update access-list ip any_src any_dst"
             else
                >&2 echo "Error: Failed update access-list ip any_src any_dst"
                exit 1
             fi
         elif [ -n "${19}" -a ${16} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip any host ${19} "
               if [ $? -eq 0 ];then
                  echo "update access-list ip any_src host_dst"
               else
                  >&2 echo "Error: Failed update access-list ip any_src host_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${14}" -a "${15}" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip host ${18} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "update access-list ip host_src ip_dst wildcard"
             else
                >&2 echo "Error: Failed update access-list ip host_src ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${18}" -a ${17} == "True" ];then
             vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip host ${18} any"
               if [ $? -eq 0 ];then
                  echo "update access-list ip host_src any_dst "
               else
                  >&2 echo "Error: Failed update access-list ip host_src any_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${19}" ];then
           vtysh -c "conf t" -c "access-list $5 seq $2 $7 ip host ${18} host ${19}"
             if [ $? -eq 0 ];then
                echo "update access-list ip host_src host_dst"
             else
                >&2 echo "Error: Failed update access-list ip host_src host_dst"
                exit 1
             fi
         fi
       elif [ -n "$6" ];then
         if [ -n "$8" -a "$9" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 $8/$9"
             if [ $? -eq 0 ];then
                echo "update access-list ip/prefix"
             else
                >&2 echo "Error: Failed update access-ist ip/prefix"
                exit 1
             fi
         elif [[ ${10} == "True" ]];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 any"
             if [ $? -eq 0 ];then
                echo "update access-list any"
             else
                >&2 echo "Error: Failed update access-ist any"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${14}" -a -n "${15}" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip ${12} ${13} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "update access-list ip ip_src wildcard ip_dst wildcard"
             else
                >&2 echo "Error: Failed update access-list ip ip_src wildcard ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${12}" -a -n "${13}" ] && [[ ${17} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip ${12} ${13} any "
               if [ $? -eq 0 ];then
                  echo "update access-list ip ip_src wildcard any_dst"
               else
                  >&2 echo "Error: Failed update access-list ip ip_src wildcard any_dst "
                  exit 1
               fi
         elif [ -n "${12}" -a -n "${13}" -a -n "${19}" ];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip ${12} ${13} host ${19} "
               if [ $? -eq 0 ];then
                  echo "update access-list ip ip_src wildcard host host_dst"
               else
                  >&2 echo "Error: Failed update access-list ip ip_src wildcard host host_dst"
                  exit 1
               fi
         elif [ -n "${14}" -a -n "${15}" ] && [[ ${16} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip any ${14} ${15} "
               if [ $? -eq 0 ];then
                    echo "update access-list ip any_src ip_dst wildcard"
               else
                  >&2 echo "Error: Failed update access-list ip any_src ip_dst wildcard"
                  exit 1
               fi
         elif [[ ${16} == "True" && ${17} == "True" ]];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip any any "
             if [ $? -eq 0 ];then
                echo "update access-list ip any_src any_dst"
             else
                >&2 echo "Error: Failed update access-list ip any_src any_dst"
                exit 1
             fi
         elif [ -n "${19}" ] && [[ ${16} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip any host ${19} "
               if [ $? -eq 0 ];then
                  echo "update access-list ip any_src host_dst"
               else
                  >&2 echo "Error: Failed update access-list ip any_src host_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${14}" -a "${15}" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip host ${18} ${14} ${15}"
             if [ $? -eq 0 ];then
                echo "update access-list ip host_src ip_dst wildcard"
             else
                >&2 echo "Error: Failed update access-list ip host_src ip_dst wildcard"
                exit 1
             fi
         elif [ -n "${18}" ] && [[ ${17} == "True" ]];then
             vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip host ${18} any"
               if [ $? -eq 0 ];then
                  echo "update access-list ip host_src any_dst "
               else
                  >&2 echo "Error: Failed update access-list ip host_src any_dst"
                  exit 1
               fi
         elif [ -n "${18}" -a -n "${19}" ];then
           vtysh -c "conf t" -c "access-list $6 seq $2 $7 ip host ${18} host ${19}"
             if [ $? -eq 0 ];then
                echo "update access-list ip host_src host_dst"
             else
                >&2 echo "Error: Failed update access-list ip host_src host_dst"
                exit 1
             fi
         fi
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
elif [[ $1 == "delete" ]];then
   if [ -n "$2" ];then
     vtysh -c "conf t" -c "no access-list $3"
       if [ $? -eq 0 ];then
          echo "delete access-list ip/prefix"
       else
          >&2 echo "Error: Failed delete access-ist ip/prefix"
          exit 1
       fi
   elif [ -n "$3" ];then
       vtysh -c "conf t" -c "no access-list $3"
         if [ $? -eq 0 ];then
            echo "delete access-list ip/prefix"
         else
            >&2 echo "Error: Failed delete access-ist ip/prefix"
            exit 1
         fi
   elif [ -n "$4" ];then
       vtysh -c "conf t" -c "no access-list $4"
         if [ $? -eq 0 ];then
            echo "delete access-list ip/prefix"
         else
            >&2 echo "Error: Failed delete access-ist ip/prefix"
            exit 1
         fi
   elif [ -n "$5" ];then
       vtysh -c "conf t" -c "no access-list $5"
         if [ $? -eq 0 ];then
            echo "delete access-list ip/prefix"
         else
            >&2 echo "Error: Failed delete access-ist ip/prefix"
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
