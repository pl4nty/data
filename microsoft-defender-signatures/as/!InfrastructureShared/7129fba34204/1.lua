-- Threat: !InfrastructureShared
-- Name: 7129fba34204
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
