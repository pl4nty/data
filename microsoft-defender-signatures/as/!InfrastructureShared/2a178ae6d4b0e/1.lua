-- Threat: !InfrastructureShared
-- Name: 2a178ae6d4b0e
-- Type: 21

if peattributes.isexe and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
