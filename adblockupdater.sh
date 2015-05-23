#!/bin/sh

##-----------------------------------------------------------------------
## Porgram: dbab-get-list
## Purpose: Get dnsmasq blocking list from pgl.yoyo.org
## Authors: Tong Sun (c) 2013
## License: BSD license
##-----------------------------------------------------------------------

dbabsvr_addr="192.168.2.1"

# Down the DNSmasq formatted ad block list
curl "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro=0&mimetype=plaintext" | sed "s/127\.0\.0\.1/$dbabsvr_addr/" > /etc/dnsmasq.d/dnsmasq.adblock.conf
echo File /etc/dnsmasq.d/dnsmasq.adblock.conf updated.

/etc/init.d/dnsmasq restart
