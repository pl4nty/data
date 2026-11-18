-- Threat: !InfrastructureShared
-- Name: 527851cf8cc5
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
