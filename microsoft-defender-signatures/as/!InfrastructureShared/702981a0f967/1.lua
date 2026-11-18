-- Threat: !InfrastructureShared
-- Name: 702981a0f967
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
