-- Threat: !InfrastructureShared
-- Name: 21178265d279b
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "xmlfc%-ni_%d%d.msi") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
