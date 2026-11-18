-- Threat: !InfrastructureShared
-- Name: 7129832d62f1
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
