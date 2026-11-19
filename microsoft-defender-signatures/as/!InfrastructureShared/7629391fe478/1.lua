-- Threat: !InfrastructureShared
-- Name: 7629391fe478
-- Type: 21

local l_0_0 = mp.getfilename():sub(-28)
if l_0_0 == "word/_rels/document.xml.rels" then
  return mp.INFECTED
end
return mp.CLEAN
