-- Threat: !InfrastructureShared
-- Name: 4678f66f0f36
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
