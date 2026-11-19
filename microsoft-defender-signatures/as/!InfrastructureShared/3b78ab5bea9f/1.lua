-- Threat: !InfrastructureShared
-- Name: 3b78ab5bea9f
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
