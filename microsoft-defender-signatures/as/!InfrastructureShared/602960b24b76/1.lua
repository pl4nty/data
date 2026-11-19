-- Threat: !InfrastructureShared
-- Name: 602960b24b76
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
