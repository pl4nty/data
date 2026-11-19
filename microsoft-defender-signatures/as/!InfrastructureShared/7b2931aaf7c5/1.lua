-- Threat: !InfrastructureShared
-- Name: 7b2931aaf7c5
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
