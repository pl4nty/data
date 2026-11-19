-- Threat: !InfrastructureShared
-- Name: 6a29e45c0e09
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
