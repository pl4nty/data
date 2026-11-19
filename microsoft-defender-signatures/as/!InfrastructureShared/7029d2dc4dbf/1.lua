-- Threat: !InfrastructureShared
-- Name: 7029d2dc4dbf
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
