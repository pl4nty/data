-- Threat: !InfrastructureShared
-- Name: 4c7847ae676c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
