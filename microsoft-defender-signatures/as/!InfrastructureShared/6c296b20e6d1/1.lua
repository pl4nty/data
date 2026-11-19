-- Threat: !InfrastructureShared
-- Name: 6c296b20e6d1
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
