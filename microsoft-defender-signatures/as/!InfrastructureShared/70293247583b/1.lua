-- Threat: !InfrastructureShared
-- Name: 70293247583b
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "word/_rels/settings.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
