-- Threat: !InfrastructureShared
-- Name: 4e78430896d6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
