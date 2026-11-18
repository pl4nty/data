-- Threat: !InfrastructureShared
-- Name: 5878732cd22c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
