#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI for Cloudflare
LUCI_DEPENDS:=+openwrt-cloudflared
LUCI_PKGARCH:=all
PKG_VERSION:=1.0
PKG_RELEASE:=1

define Package/luci-app-cloudflared/postrm
	rm -f /tmp/luci-indexcache
endef

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-cloudflared/conffiles
	/etc/config/cloudflared
endef

define Package/luci-app-cloudflared/prerm
	mv /usr/share/luci-app-cloudflared/cloudflared.init.orig /etc/init.d/cloudflared
endef
# call BuildPackage - OpenWrt buildroot signature


