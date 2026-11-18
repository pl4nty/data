-- Threat: !InfrastructureShared
-- Name: 5078ad814470
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
