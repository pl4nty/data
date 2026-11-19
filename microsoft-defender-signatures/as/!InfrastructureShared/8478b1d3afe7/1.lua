-- Threat: !InfrastructureShared
-- Name: 8478b1d3afe7
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
