-- Threat: !InfrastructureShared
-- Name: 3378f69fffd8
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
