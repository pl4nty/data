-- Threat: !InfrastructureShared
-- Name: 6c2908ec14d0
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
