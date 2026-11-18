-- Threat: !InfrastructureShared
-- Name: 1a61929f954c
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
