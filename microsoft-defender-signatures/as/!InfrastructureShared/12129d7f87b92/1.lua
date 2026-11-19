-- Threat: !InfrastructureShared
-- Name: 12129d7f87b92
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
