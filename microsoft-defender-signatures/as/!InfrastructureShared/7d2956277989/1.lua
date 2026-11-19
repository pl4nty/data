-- Threat: !InfrastructureShared
-- Name: 7d2956277989
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
