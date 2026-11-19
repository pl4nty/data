-- Threat: !InfrastructureShared
-- Name: 6fb33b592374
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
if string.match(l_0_0, "powershell.+hidden.+bypass.+system%.net%.webclient.+downloadfile.+http.+%.exe.+&%s*reg%s*add%s*hkcu.+software.+classes.+mscfile.+shell.+open.+command%s*/d%s*.+%.exe%s*/f%s*&%s*eventvwr%.exe") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
