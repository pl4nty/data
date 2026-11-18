-- Threat: !InfrastructureShared
-- Name: 5b29de7396be
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "drawing1.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
