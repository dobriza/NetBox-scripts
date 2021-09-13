# NetBox-scripts

## How to use the script:
1. Get Netbox token, specify it as Token variable
2. Analize switches without physical labels on their cables and then add appropriate label to "Label" section of switch interface at Netbox.
3. Specify your label name as a Label1 variable
4. Specify Netbox IP address 
5. Run the script as follows

```
./find_interfaces_without_labels.sh SR01 SW01 SW02 

```
6. Find a file "cables_without_labels_$(date).txt" with interfaces without labels on your working directory
