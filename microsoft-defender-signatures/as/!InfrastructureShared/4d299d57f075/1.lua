-- Threat: !InfrastructureShared
-- Name: 4d299d57f075
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
