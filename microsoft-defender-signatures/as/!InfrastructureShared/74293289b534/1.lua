-- Threat: !InfrastructureShared
-- Name: 74293289b534
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
