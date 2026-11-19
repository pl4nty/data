-- Threat: !InfrastructureShared
-- Name: 2c781373fb4c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
