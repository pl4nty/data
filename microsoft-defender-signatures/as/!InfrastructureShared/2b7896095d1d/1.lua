-- Threat: !InfrastructureShared
-- Name: 2b7896095d1d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
