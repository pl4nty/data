-- Threat: !InfrastructureShared
-- Name: a478a2de28ac
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
