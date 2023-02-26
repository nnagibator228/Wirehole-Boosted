# Wirehole-Boosted
Imprelemntation of Wirehole with Prometheus/Grafana monitoring and extra DNS over https by Cloudfare & IPsec for Linux compatability.

#### Check out new ```/rproxy/``` branch. Allows you accessing web dashboards without entering internal VPN network only with public host IP

# QuickStart
 - Clone repo
 - Enter folder
 - Run the installation script
 - Set Pihole upstream DNS to 172.24.0.7 if not set (from web UI)
 - Set Prometheus as Grafana data source (from web UI)
 - Import selected Grafana monitoring dashboards from file (from web UI)
```
git clone https://github.com/nnagibator228/Wirehole-Boosted.git
cd Wirehole-Boosted
chmod +x install_script.sh && ./install_script.sh
```

![prom datasource import](https://github.com/nnagibator228/Wirehole-Boosted/blob/main/seq.png)

# FAQ
 - #### How to get IPsec credentials?
 use ```sudo docker log <ipsec_container_id>``` command. In order to get IPsec container id, use ```docker container ls```;
 - #### How to add extra peers?
 In order to add extra peers to wireguard, change ```PEERS``` env variable in compose file;
 In order to add extra peers to ipsec, use ```VPN_ADDL_USERS=additional_username_1 additional_username_2``` ```VPN_ADDL_PASSWORDS=additional_password_1 additional_password_2``` fields as env variables;
 - #### How to access Pihole Web UI?
 After connecting to vpn tunnel, access ```172.24.0.3/admin/```;
 - #### How to access Prometheus Web UI?
 After connecting to vpn tunnel, access ```172.24.0.12:9090```;
 - #### How to access Grafana Web UI?
 After connecting to vpn tunnel, access ```172.24.0.4:3000```;
 - #### How to check WireGuard Exporter data?
 After connecting to vpn tunnel, access ```172.24.0.2:9586/metrics```;
 - #### How to check Node Exporter data?
 After connecting to vpn tunnel, access ```172.24.0.8:9100/metrics```;
 - #### How to check CadVisor data?
 After connecting to vpn tunnel, access ```172.24.0.10:8080/metrics```;
 - #### Whats default password for Pihole?
 The default password for Pihole is set explicitly in docker-compose file as **test123** It is strongly recommended to change it!
 - #### Whats default credetials for Grafana?
 The default credetials for Grafana are **admin:admin** You will be prompted to change the default password after the first login.
 - #### Where to get suitable Grafana dashboards?
 Suitable Grafana dashboards as ***.json*** files could be found in ```dashboards/```  folder in repository;
 - #### Where to get additional block lists?
 https://firebog.net/ - that blocklist connection list website. Taken from the original Wirehole repo;
# VPN Infrastructure model
![infra scheme](https://github.com/nnagibator228/Wirehole-Boosted/blob/main/scheme.png)
