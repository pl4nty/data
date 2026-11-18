-- Threat: !InfrastructureShared
-- Name: 40295025e1d1
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
