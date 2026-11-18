-- Threat: !InfrastructureShared
-- Name: 6d294742578d
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
