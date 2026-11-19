-- Threat: !InfrastructureShared
-- Name: c7782165a435
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
