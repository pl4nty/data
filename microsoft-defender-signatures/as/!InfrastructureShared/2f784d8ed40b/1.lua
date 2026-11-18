-- Threat: !InfrastructureShared
-- Name: 2f784d8ed40b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
