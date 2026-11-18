-- Threat: !InfrastructureShared
-- Name: 7b7819db3a7a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
