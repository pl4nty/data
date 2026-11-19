-- Threat: !InfrastructureShared
-- Name: 7a786b26b6e1
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
