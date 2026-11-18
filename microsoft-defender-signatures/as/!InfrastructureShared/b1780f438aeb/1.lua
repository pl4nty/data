-- Threat: !InfrastructureShared
-- Name: b1780f438aeb
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
