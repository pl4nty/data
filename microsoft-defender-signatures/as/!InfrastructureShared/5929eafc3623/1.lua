-- Threat: !InfrastructureShared
-- Name: 5929eafc3623
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
