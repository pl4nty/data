-- Threat: !InfrastructureShared
-- Name: 1682957c357b4
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
