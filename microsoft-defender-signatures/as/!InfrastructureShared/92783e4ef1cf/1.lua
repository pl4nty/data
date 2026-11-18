-- Threat: !InfrastructureShared
-- Name: 92783e4ef1cf
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
