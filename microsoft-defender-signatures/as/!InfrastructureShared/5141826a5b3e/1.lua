-- Threat: !InfrastructureShared
-- Name: 5141826a5b3e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
