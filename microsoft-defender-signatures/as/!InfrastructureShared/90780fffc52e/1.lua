-- Threat: !InfrastructureShared
-- Name: 90780fffc52e
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
