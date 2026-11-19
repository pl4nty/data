-- Threat: !InfrastructureShared
-- Name: 84788fac5c0b
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
