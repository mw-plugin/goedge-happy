[Unit]
Description=CDN&WAF cluster management system
After=network.target

[Service]
Type=forking
WorkingDirectory={$SERVER_PATH}/goedge-happy
ExecStart={$SERVER_PATH}/goedge-happy/bin/edge-admin start
ExecReload=/bin/kill -USR2 $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target