-- Threat: !InfrastructureShared
-- Name: 2c78e462a2d9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
