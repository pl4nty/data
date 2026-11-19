-- Threat: !InfrastructureShared
-- Name: fe78733ac4e2
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
