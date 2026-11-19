-- Threat: !InfrastructureShared
-- Name: a229e2e4a64c
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
