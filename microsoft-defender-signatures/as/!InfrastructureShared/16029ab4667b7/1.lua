-- Threat: !InfrastructureShared
-- Name: 16029ab4667b7
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
