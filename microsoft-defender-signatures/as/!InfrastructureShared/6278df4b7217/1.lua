-- Threat: !InfrastructureShared
-- Name: 6278df4b7217
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
