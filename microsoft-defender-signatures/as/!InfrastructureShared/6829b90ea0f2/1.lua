-- Threat: !InfrastructureShared
-- Name: 6829b90ea0f2
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
