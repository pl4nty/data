-- Threat: !InfrastructureShared
-- Name: 1a629bafac362
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "xl/drawings/_rels/drawing1.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
