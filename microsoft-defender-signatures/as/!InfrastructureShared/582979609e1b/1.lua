-- Threat: !InfrastructureShared
-- Name: 582979609e1b
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
