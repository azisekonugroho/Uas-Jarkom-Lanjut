# jan/25/2024 14:39:05 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
#Kelompok Tiara Aulia S, Azis Eko Nugroho, Bagas Mahesa, M Fahri R
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface vlan
add interface=ether4 name=vlan99 vlan-id=99
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=10.10.10.2-10.10.10.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether4 name=dhcp1

# Change the IP address below
/ip address
set [ find interface=ether4 ] address=10.10.10.1/24 network=10.10.10.0

/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
set [ find address=10.10.10.0/24 ] gateway=10.10.10.1

/ip firewall nat
add action=masquerade chain=srcnat
/system clock
set time-zone-name=Asia/Jakarta
