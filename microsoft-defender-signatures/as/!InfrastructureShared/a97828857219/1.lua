-- Threat: !InfrastructureShared
-- Name: a97828857219
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
