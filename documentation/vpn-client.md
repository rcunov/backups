## Linux VPN client setup

Add to `/etc/default/openvpn`
```
AUTOSTART="autostart"
```

Add to `/etc/openvpn/autostart.conf`
```
dhcp-option DNS 10.0.0.244
keepalive 10 120
auth-user-pass .vpn-secrets

disable-occ
script-security 2
up /etc/openvpn/update-resolv-conf
down /etc/openvpn/update-resolv-conf
```
Second block makes sure traffic won't go outside the VPN

---

Add to crontab
```
0 */8 * * * systemctl restart openvpn
```
Dumb fix for weird permanent connection drop
