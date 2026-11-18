-- Threat: !InfrastructureShared
-- Name: c678e4d6eb36
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
