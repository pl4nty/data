-- Threat: !InfrastructureShared
-- Name: 722954c0617c
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
