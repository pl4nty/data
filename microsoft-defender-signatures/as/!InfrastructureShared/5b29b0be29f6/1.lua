-- Threat: !InfrastructureShared
-- Name: 5b29b0be29f6
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
