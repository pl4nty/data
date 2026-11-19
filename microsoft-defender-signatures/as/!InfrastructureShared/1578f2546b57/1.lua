-- Threat: !InfrastructureShared
-- Name: 1578f2546b57
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
