-- Threat: !InfrastructureShared
-- Name: 8d78ed7880dd
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
