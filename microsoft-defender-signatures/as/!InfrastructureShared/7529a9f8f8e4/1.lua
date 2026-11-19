-- Threat: !InfrastructureShared
-- Name: 7529a9f8f8e4
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
