-- Threat: !InfrastructureShared
-- Name: 6f294cb9ef32
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
