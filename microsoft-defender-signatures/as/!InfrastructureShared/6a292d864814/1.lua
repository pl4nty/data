-- Threat: !InfrastructureShared
-- Name: 6a292d864814
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
