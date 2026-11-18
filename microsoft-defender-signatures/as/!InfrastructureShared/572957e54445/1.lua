-- Threat: !InfrastructureShared
-- Name: 572957e54445
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
