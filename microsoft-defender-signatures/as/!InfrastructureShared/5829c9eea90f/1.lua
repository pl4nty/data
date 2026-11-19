-- Threat: !InfrastructureShared
-- Name: 5829c9eea90f
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
