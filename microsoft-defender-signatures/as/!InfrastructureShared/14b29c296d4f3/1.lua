-- Threat: !InfrastructureShared
-- Name: 14b29c296d4f3
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
