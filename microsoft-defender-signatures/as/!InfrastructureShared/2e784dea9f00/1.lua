-- Threat: !InfrastructureShared
-- Name: 2e784dea9f00
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
