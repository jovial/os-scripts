os_ipmi_addr() {
    while read -r; do
        node_id="$REPLY"
        openstack baremetal node show -c driver_info --format json \
             "$node_id" | jq -r ".driver_info.ipmi_address"
    done
}
