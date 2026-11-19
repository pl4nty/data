-- Threat: !InfrastructureShared
-- Name: 66291b22394d
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
