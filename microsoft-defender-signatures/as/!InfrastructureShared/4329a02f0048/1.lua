-- Threat: !InfrastructureShared
-- Name: 4329a02f0048
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
