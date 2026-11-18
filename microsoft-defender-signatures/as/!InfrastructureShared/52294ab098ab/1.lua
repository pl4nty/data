-- Threat: !InfrastructureShared
-- Name: 52294ab098ab
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "websettings.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
