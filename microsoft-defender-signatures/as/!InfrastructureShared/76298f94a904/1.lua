-- Threat: !InfrastructureShared
-- Name: 76298f94a904
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
