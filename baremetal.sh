os_ipmi_addr() {
    # node id to ipmi addr
    while read -r; do
        node_id="$REPLY"
        openstack baremetal node show -c driver_info --format json \
             "$node_id" | jq -r ".driver_info.ipmi_address"
    done
}

os_ironic_node() {
    # instance id from openstack server list to node id
    while read -r; do
        instance_id="$REPLY"
        openstack baremetal node list -f value -c Name -c 'Instance UUID' | \
            grep "$(openstack server $instance_id -f value -c id)" | cut -d " " -f1
    done
}


