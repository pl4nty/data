-- Threat: !InfrastructureShared
-- Name: 17b2945589f35
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
