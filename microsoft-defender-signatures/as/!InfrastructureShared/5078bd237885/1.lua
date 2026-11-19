-- Threat: !InfrastructureShared
-- Name: 5078bd237885
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
