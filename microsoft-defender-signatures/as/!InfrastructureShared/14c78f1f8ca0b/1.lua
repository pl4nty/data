-- Threat: !InfrastructureShared
-- Name: 14c78f1f8ca0b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
