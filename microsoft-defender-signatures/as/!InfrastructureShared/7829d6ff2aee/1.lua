-- Threat: !InfrastructureShared
-- Name: 7829d6ff2aee
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
