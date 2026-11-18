-- Threat: !InfrastructureShared
-- Name: 3578b4ae8e93
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
