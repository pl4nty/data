-- Threat: !InfrastructureShared
-- Name: 5629a7f182be
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
