-- Threat: !InfrastructureShared
-- Name: 5029fd12dcc8
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "websettings.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
