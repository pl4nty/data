-- Threat: !InfrastructureShared
-- Name: 3a78865cd2c8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
