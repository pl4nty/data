-- Threat: !InfrastructureShared
-- Name: 6529fe17f93b
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
