-- Threat: !InfrastructureShared
-- Name: 6f292c2aee8e
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
