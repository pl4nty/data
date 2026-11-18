-- Threat: !InfrastructureShared
-- Name: 722916a99cb4
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
