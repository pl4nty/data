-- Threat: !InfrastructureShared
-- Name: 2c7824113a24
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
