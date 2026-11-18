-- Threat: !InfrastructureShared
-- Name: 397894a896ae
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
