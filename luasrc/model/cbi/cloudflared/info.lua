local fs = require "nixio.fs"
local conffile = "/tmp/cloudflared.info"

f = SimpleForm("logview")

t = f:field(TextValue, "conf")
t.rmempty = true
t.rows = 30
function t.cfgvalue()
  luci.sys.exec("logread | grep cloudflared > /tmp/cloudflared.info")
	return fs.readfile(conffile) or ""
end
t.readonly="readonly"

return f