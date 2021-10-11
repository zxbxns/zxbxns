#!/bin/bash
# Proxy For Edukasi & Imclass
# ==============================

# Getting Proxy Template
wget -q -O /usr/local/bin/ssh-ws http://script.zxbxns.my.id/sc/ssh-ws.py
chmod +x /usr/local/bin/ssh-ws

# Installing Service
cat > /etc/systemd/system/ssh-ws.service << END
[Unit]
Description=Python Edu Proxy By Mail Service
Documentation=https://t.me/zxbxns
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ssh-ws 2082
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ssh-ws
systemctl restart ssh-ws

# Hapus Script
rm -f /root/ssh-ws.sh
