# Wirehole-Boosted
Imprelemntation of Wirehole with Prometheus/Grafana monitoring accessed from external web by ip with Traefik BasicAuth security and extra DNS over https by Cloudfare & IPsec for Linux compatability.
# QuickStart
 - Clone repo
 - Enter folder
 - Run the installation script with flags:

 **-u / --user** - Traefik BasicAuth username;
 
 **-p / --passwd** - Traefik BasicAuth password (would be hashed);
 
If flags are not specified, than default credentials would be **test123:TestForVPN123**

 - Set Pihole upstream DNS to 172.24.0.7 if not set (from web UI)
 - Set Prometheus as Grafana data source (from web UI)
 - Import selected Grafana monitoring dashboards from file (from web UI)
```
git clone https://github.com/nnagibator228/Wirehole-Boosted.git
cd Wirehole-Boosted
chmod +x install_script.sh && ./install_script.sh -u admin -p admin
```

![prom datasource import](https://github.com/nnagibator228/Wirehole-Boosted/blob/rproxy/seq.png)

# Features to add
 > Adding Heimdall or equivalent service for organizing dashboard links
 
 > Adding OAuth2 external services for more security

# FAQ
 - #### How to get IPsec credentials?
 use ```sudo docker log <ipsec_container_id>``` command. In order to get IPsec container id, use ```docker container ls```;
 - #### How to add extra peers?
 In order to add extra peers to wireguard, change ```PEERS``` env variable in compose file;
 In order to add extra peers to ipsec, use ```VPN_ADDL_USERS=additional_username_1 additional_username_2``` ```VPN_ADDL_PASSWORDS=additional_password_1 additional_password_2``` fields as env variables;
 - #### How to access Pihole Web UI?
 You can access —   ```<your server's ip>/admin/``` than authenticate with Traefik BasicAuth;
 - #### How to access Prometheus Web UI?
 You can access —  ```<your server's ip>/prometheus/``` than authenticate with Traefik BasicAuth;
 - #### How to access Grafana Web UI?
 You can access —  ```<your server's ip>/grafana/``` than authenticate with Traefik BasicAuth;
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
