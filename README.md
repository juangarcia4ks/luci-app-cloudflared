# luci-app-cloudflared

(base on luci-app-zerotier https://github.com/rufengsuixing/luci-app-zerotier.git)

luci app to setting cloudflared tunnel <br>
use to expose domoticz default web port 8080

# install

        cd package/feeds/
        git clone https://github.com/khongpt/luci-app-cloudflared.git
        
        ** remove line 10: LUCI_DEPENDS:=+openwrt-cloudflared in Makefile
        ** rm files/etc/init.d/cloudflared if it exist!
        ** remove line 49 $(INSTALL_BIN) ./cloudflared.init $(1)/etc/init.d/cloudflared in 
                \golex\2002\openwrt\package\feeds\openwrt-cloudflared\Makefile
