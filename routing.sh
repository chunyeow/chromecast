airmon-ng start wlan0
ifconfig wlan1 192.168.75.1/24
iptables --policy INPUT ACCEPT
iptables --policy OUTPUT ACCEPT
iptables --policy FORWARD ACCEPT
iptables -t nat -F
iptables -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i wlan1 -o eth0 -j ACCEPT
echo '1' > /proc/sys/net/ipv4/ip_forward
route add 239.255.255.250 dev wlan1
service dnsmasq restart
hostapd /etc/hostapd/hostapd.conf &
