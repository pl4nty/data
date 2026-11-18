-- Threat: !InfrastructureShared
-- Name: 6d29f1758bf4
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
