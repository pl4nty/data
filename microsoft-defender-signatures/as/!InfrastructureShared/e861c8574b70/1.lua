-- Threat: !InfrastructureShared
-- Name: e861c8574b70
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
