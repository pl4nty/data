-- Threat: !InfrastructureShared
-- Name: 27785678e32e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
