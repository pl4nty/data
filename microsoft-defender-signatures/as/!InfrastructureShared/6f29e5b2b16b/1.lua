-- Threat: !InfrastructureShared
-- Name: 6f29e5b2b16b
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
