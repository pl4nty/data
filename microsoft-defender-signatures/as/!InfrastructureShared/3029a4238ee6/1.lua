-- Threat: !InfrastructureShared
-- Name: 3029a4238ee6
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
