-- Threat: !InfrastructureShared
-- Name: 17378742b907b
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
