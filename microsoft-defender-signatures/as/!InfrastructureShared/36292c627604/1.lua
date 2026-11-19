-- Threat: !InfrastructureShared
-- Name: 36292c627604
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
