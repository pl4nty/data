-- Threat: !InfrastructureShared
-- Name: 67785b58bc38
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
