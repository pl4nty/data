-- Threat: !InfrastructureShared
-- Name: 5978931b5c33
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
