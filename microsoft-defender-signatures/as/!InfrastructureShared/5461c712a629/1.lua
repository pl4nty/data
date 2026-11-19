-- Threat: !InfrastructureShared
-- Name: 5461c712a629
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
