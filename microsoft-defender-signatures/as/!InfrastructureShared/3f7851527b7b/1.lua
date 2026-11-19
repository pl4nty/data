-- Threat: !InfrastructureShared
-- Name: 3f7851527b7b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
