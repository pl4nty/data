-- Threat: !InfrastructureShared
-- Name: 91781b459860
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
