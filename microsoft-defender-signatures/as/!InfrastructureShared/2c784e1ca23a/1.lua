-- Threat: !InfrastructureShared
-- Name: 2c784e1ca23a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
