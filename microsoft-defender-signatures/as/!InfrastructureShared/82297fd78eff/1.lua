-- Threat: !InfrastructureShared
-- Name: 82297fd78eff
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
