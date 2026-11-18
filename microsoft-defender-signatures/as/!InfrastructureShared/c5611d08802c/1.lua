-- Threat: !InfrastructureShared
-- Name: c5611d08802c
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
