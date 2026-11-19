-- Threat: !InfrastructureShared
-- Name: 3278678ba815
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
