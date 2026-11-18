-- Threat: !InfrastructureShared
-- Name: 5c6171008638
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
