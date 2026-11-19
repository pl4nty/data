-- Threat: !InfrastructureShared
-- Name: 3a7853f31b23
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
