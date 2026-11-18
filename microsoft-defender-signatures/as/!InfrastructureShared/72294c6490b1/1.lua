-- Threat: !InfrastructureShared
-- Name: 72294c6490b1
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
