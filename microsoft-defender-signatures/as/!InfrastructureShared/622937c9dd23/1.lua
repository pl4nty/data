-- Threat: !InfrastructureShared
-- Name: 622937c9dd23
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
