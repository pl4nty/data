-- Threat: !InfrastructureShared
-- Name: 10978b735e470
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
