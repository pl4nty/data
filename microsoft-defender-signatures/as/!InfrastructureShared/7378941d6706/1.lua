-- Threat: !InfrastructureShared
-- Name: 7378941d6706
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
