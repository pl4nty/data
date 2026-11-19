-- Threat: !InfrastructureShared
-- Name: 6878bcde4348
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
