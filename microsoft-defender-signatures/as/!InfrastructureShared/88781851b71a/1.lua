-- Threat: !InfrastructureShared
-- Name: 88781851b71a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
