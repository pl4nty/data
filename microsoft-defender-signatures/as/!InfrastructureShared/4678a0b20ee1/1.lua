-- Threat: !InfrastructureShared
-- Name: 4678a0b20ee1
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
