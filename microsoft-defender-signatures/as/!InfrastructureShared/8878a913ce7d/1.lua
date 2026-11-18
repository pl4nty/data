-- Threat: !InfrastructureShared
-- Name: 8878a913ce7d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
