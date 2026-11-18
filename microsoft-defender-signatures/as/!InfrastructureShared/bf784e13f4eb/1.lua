-- Threat: !InfrastructureShared
-- Name: bf784e13f4eb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
