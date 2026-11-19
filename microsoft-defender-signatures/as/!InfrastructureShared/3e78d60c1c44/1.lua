-- Threat: !InfrastructureShared
-- Name: 3e78d60c1c44
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
