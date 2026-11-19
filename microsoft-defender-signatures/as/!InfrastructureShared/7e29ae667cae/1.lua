-- Threat: !InfrastructureShared
-- Name: 7e29ae667cae
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
