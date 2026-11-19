-- Threat: !InfrastructureShared
-- Name: 45b3333e62af
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -17) == "searchindexer.exe" or string.sub(l_0_0, -22) == "searchprotocolhost.exe" or string.sub(l_0_0, -20) == "searchfilterhost.exe" then
  return mp.INFECTED
end
return mp.CLEAN
