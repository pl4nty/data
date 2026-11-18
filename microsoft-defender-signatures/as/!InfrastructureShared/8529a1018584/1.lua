-- Threat: !InfrastructureShared
-- Name: 8529a1018584
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
