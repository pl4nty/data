-- Threat: !InfrastructureShared
-- Name: c329346087ea
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
