-- Threat: !InfrastructureShared
-- Name: 6678642bc1f6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
