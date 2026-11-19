-- Threat: !InfrastructureShared
-- Name: c529b9196171
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
