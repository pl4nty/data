-- Threat: !InfrastructureShared
-- Name: 7b29bf015ebd
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
