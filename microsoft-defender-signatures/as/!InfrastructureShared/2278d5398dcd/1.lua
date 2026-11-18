-- Threat: !InfrastructureShared
-- Name: 2278d5398dcd
-- Type: 21

if peattributes.hasexports == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
