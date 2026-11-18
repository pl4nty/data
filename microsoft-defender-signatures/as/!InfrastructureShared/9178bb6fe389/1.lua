-- Threat: !InfrastructureShared
-- Name: 9178bb6fe389
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
