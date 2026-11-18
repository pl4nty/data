-- Threat: !InfrastructureShared
-- Name: 472900cf1346
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "word/_rels/settings.xml.rels") ~= nil and mp.getfilesize() < 1000 then
  return mp.INFECTED
end
return mp.CLEAN
