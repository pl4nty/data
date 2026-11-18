-- Threat: !InfrastructureShared
-- Name: 1f787ea68b4f
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
