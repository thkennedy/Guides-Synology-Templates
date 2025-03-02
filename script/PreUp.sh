wgserver=$(grep Endpoint "${CONFIG_DIR}/wireguard/wg0.conf" | awk '{print $3}')
gateway=$(ip -o -4 route show to default | awk '{print $3}')

ip -4 route add ${wgserver%:*} via ${gateway} dev eth0
