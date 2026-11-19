-- Threat: !InfrastructureShared
-- Name: 6478fb583a36
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
