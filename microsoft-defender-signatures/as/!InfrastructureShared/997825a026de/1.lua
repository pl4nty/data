-- Threat: !InfrastructureShared
-- Name: 997825a026de
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
