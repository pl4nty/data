-- Threat: !InfrastructureShared
-- Name: 7a78bf518b08
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
