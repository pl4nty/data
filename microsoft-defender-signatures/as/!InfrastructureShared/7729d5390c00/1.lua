-- Threat: !InfrastructureShared
-- Name: 7729d5390c00
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
