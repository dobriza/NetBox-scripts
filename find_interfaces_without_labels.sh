#!/bin/bash
Token="7e632b00f67ab3676b437deb24da5699d5f9826c"
BaseURL="http://10.33.0.32/api/dcim/interfaces"
Label1="CABLE LABEL IS NEEDED"
Label2="TEMPORARY UNUSED %26%26 CABLE LABEL IS NEEDED"


echo $(date) > "./$(date +%F)_cables_without_labels.txt"
for arg in "$@"; do


      device_Id=$(curl -s --location --request GET \
      "10.33.0.32/api/dcim/devices/?name=$arg" \
      --header "Authorization: Token $Token" |jq '.results[].id')
      
      if [ -z "$device_Id"  ]
        then 
            echo "ERROR, DEVICE_ID not found!"
            exit 1
 
      fi    

      
      interfaces=$(curl -s --location --request GET \
      "10.33.0.32/api/dcim/interfaces/?device_id=$device_Id&label=$Label1&label=$Label2" \
      --header "Authorization: Token $Token" |jq '.results[].name')


      echo -e "$arg interfaces without labels:\n$interfaces" >> ./$(date +%F)_cables_without_labels.txt
                 
                 

done

########## Check for arguments are supplied #################

if [ $# -eq 0 ]
  then
    echo "No arguments supplied!"
    echo -e "#\n#\n#\nRun the script in a following way:\n./script_get_labels_for_yuriy.sh SW01 SW02 SW03\n#\n#\n#"
fi
