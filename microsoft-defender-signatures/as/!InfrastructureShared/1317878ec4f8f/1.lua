-- Threat: !InfrastructureShared
-- Name: 1317878ec4f8f
-- Type: 21

if peattributes.isexe and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
