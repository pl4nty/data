-- Threat: !InfrastructureShared
-- Name: 5d788e962268
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
