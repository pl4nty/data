-- Threat: !InfrastructureShared
-- Name: 6c29b7e8fdd8
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
