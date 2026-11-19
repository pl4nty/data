-- Threat: !InfrastructureShared
-- Name: 5578125eb8b0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
