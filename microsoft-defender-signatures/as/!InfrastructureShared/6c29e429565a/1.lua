-- Threat: !InfrastructureShared
-- Name: 6c29e429565a
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "word/_rels/document.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
