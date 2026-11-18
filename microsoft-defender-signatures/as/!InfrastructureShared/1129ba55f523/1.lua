-- Threat: !InfrastructureShared
-- Name: 1129ba55f523
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "/document.xml", 1, true) or string.find(l_0_0, "xl/externallinks/", 1, true) or string.find(l_0_0, "->(ole stream 0)->(msg)", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
