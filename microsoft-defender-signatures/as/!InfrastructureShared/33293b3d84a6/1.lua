-- Threat: !InfrastructureShared
-- Name: 33293b3d84a6
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
