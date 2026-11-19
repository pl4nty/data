-- Threat: !InfrastructureShared
-- Name: 447830abd6f4
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
