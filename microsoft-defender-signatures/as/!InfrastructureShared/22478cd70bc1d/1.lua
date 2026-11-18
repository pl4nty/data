-- Threat: !InfrastructureShared
-- Name: 22478cd70bc1d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
