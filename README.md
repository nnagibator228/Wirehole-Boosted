# Wirehole-Boosted
Imprelemntation of Wirehole with extra DNS over https by Cloudfare and IPsec for Linux compatability.
# QuickStart
 - Clone repo
 - Enter folder
 - Run the installation script
 - Set Pihole upstream DNS to 172.24.0.7 if not set (from web UI)
```
git clone https://github.com/nnagibator228/Wirehole-Boosted.git
cd Wirehole-Boosted
chmod +x install_script.sh && ./install_script.sh
```
# FAQ
 - ### How to get IPsec credentials?
 use ```sudo docker log <ipsec_container_id>``` command. In order to get IPsec container id, use ```docker container ls```;
 - ### How to add extra peers?
 In order to add extra peers to wireguard, change ```PEERS``` env variable in compose file;
 In order to add extra peers to ipsec, use ```VPN_ADDL_USERS=additional_username_1 additional_username_2``` ```VPN_ADDL_PASSWORDS=additional_password_1 additional_password_2``` fields as env variables;
 - ### How to access pihole?
 After connecting to vpn tunnel, access 172.24.0.3 ip address;
 - ### Where to get additional block lists?
 https://firebog.net/ - that blocklist connection list website. Taken from the original Wirehole repo;
# Infrastructure model
![infra scheme](https://github.com/nnagibator228/Wirehole-Boosted/scheme.png)
