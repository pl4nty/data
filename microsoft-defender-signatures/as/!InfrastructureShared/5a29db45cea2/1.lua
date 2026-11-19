-- Threat: !InfrastructureShared
-- Name: 5a29db45cea2
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
