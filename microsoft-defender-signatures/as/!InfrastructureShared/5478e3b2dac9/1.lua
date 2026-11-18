-- Threat: !InfrastructureShared
-- Name: 5478e3b2dac9
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
