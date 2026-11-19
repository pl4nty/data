-- Threat: !InfrastructureShared
-- Name: 45401f11d8e1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
