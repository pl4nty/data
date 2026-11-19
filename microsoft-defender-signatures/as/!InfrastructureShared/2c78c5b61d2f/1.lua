-- Threat: !InfrastructureShared
-- Name: 2c78c5b61d2f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
