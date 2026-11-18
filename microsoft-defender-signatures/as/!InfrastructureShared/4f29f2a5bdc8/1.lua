-- Threat: !InfrastructureShared
-- Name: 4f29f2a5bdc8
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "websettings.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
