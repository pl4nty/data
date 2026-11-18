-- Threat: !InfrastructureShared
-- Name: 5f78c8c744dd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
