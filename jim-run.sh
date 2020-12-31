docker run -v $PWD/vpn-data:/etc/openvpn --env OVPN_NATDEVICE=eno1 --user $(id -u):$(id -g) --rm jimlin7777/vpn-server \
    ovpn_genconfig -u udp://ciocr.bravoai.com:1194 -p "route ciocr.bravoai.com" -p "route 122.147.1.39"
