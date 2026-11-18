-- Threat: !InfrastructureShared
-- Name: 13261a1ac2661
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
