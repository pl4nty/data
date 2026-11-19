-- Threat: !InfrastructureShared
-- Name: f629f92d5c8c
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
