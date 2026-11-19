-- Threat: !InfrastructureShared
-- Name: 83291346b03f
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
