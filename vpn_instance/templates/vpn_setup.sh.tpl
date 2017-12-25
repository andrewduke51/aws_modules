#!/usr/bin/env bash

tmp=/tmp/configure_ipsec.temp
final=/tmp/configure_ipsec.sh

cat <<EOF>> /tmp/sed.sh
#!/usr/bin/env bash

/bin/sed -i "s:{{ vpn_username }}:${vpn_username}:g" $tmp
/bin/sed -i "s:{{ vpn_password }}:${vpn_password}:g" $tmp
/bin/sed -i "s:{{ ip_sec_key }}:${ip_sec_key}:g" $tmp

cp $tmp $final
chmod +x $final
/bin/bash $final
EOF

sleep 26s

chmod +x /tmp/sed.sh
/bin/bash /tmp/sed.sh