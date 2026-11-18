-- Threat: !InfrastructureShared
-- Name: 2c7897f26107
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
