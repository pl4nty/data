-- Threat: !InfrastructureShared
-- Name: 45b33a615f82
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil and (string.find(l_0_0, "\\inetsrv", 1, true) or string.find(l_0_0, "\\apache", 1, true) or string.find(l_0_0, "\\tomcat", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
