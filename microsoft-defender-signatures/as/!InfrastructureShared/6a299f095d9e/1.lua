-- Threat: !InfrastructureShared
-- Name: 6a299f095d9e
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
