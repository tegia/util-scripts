
#!/bin/bash -xe
NODE_EXPORTER_VERSION=0.18.1

echo "Create node_exporter user"
useradd -M -r -s /bin/false node_exporter

echo "Download node exporter ${NODE_EXPORTER_VERSION}"
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
tar xzf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
cp node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/
chown node_exporter:node_exporter /usr/local/bin/node_exporter

echo "Create service"
cat <<- EOF > /etc/systemd/system/node_exporter.service    
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
EOF


echo "Reload and start"
export LC_ALL=en_US.UTF-8; 
export LANG=en_US.UTF-8; 
systemctl daemon-reload; 
systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter
