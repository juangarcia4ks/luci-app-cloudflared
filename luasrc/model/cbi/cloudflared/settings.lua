
a=Map("cloudflared",translate("Cloudflared"),translate("Tunnel client - formerly Argo Tunnel"))
a:section(SimpleSection).template  = "cloudflared/cloudflared_status"

t=a:section(NamedSection,"sample_config","cloudflared")
t.anonymous=true
t.addremove=false

e=t:option(Flag,"enabled",translate("Enable"))
e.default=0
e.rmempty=false

e=t:option(DynamicList,"token",translate('Tunnel Token'))
e.password=true
e.rmempty=false

e=t:option(Flag,"free",translate("Tunnel with free random URL"))
e.default=0
e.rmempty=false

e=t:option(DummyValue,"opennewwindow" , 
	translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"cloudflared.com\" onclick=\"window.open('https://dash.teams.cloudflare.com')\" />"))
e.description = translate("Create or manage your cloudflared tunnel")

return a
