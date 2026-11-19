-- Threat: !InfrastructureShared
-- Name: 3d292ae756b3
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
