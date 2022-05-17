module("luci.controller.cloudflared",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/cloudflared")then
return
end

entry({"admin","vpn"}, firstchild(), "VPN", 49).dependent = false

entry({"admin", "vpn", "cloudflared"},firstchild(), _("Cloudflared")).dependent = false

entry({"admin", "vpn", "cloudflared", "general"},cbi("cloudflared/settings"), _("Setting"), 1)
entry({"admin", "vpn", "cloudflared", "log"},form("cloudflared/info"), _("Tunnel Info"), 2)

entry({"admin","vpn","cloudflared","status"},call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("pgrep /usr/bin/cloudflared >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
