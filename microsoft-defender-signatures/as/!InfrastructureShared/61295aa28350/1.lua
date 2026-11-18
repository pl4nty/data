-- Threat: !InfrastructureShared
-- Name: 61295aa28350
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
