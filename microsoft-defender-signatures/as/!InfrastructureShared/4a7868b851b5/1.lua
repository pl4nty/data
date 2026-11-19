-- Threat: !InfrastructureShared
-- Name: 4a7868b851b5
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
