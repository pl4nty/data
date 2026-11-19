-- Threat: !InfrastructureShared
-- Name: 7129ac9d9bb0
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
