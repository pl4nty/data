-- Threat: !InfrastructureShared
-- Name: 9f78844b3db9
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.get_mpattribute("FOP64:GoLang64") then
  return mp.INFECTED
end
return mp.CLEAN
