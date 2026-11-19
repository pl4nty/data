-- Threat: !InfrastructureShared
-- Name: 4878d25d2c0c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
