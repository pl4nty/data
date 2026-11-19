-- Threat: !InfrastructureShared
-- Name: c540b9e71997
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
