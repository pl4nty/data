-- Threat: !InfrastructureShared
-- Name: 4261878794d0
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
