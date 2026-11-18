-- Threat: !InfrastructureShared
-- Name: 5129ee430b55
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0:len() >= 28 and l_0_0:sub(-28):lower() == "word/_rels/settings.xml.rels" then
  return mp.INFECTED
end
return mp.CLEAN
