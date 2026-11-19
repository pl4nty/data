-- Threat: !InfrastructureShared
-- Name: a329c69e9d59
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "settings.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
