-- Threat: !InfrastructureShared
-- Name: d129a70a4cd9
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
