-- Threat: !InfrastructureShared
-- Name: 997803d2eafd
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
