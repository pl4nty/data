-- Threat: !InfrastructureShared
-- Name: 7f7822a3ebd1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
