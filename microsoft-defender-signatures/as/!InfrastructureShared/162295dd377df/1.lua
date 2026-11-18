-- Threat: !InfrastructureShared
-- Name: 162295dd377df
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
