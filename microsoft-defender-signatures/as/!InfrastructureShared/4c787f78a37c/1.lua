-- Threat: !InfrastructureShared
-- Name: 4c787f78a37c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
