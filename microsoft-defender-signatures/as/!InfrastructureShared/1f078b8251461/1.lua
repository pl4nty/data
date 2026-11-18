-- Threat: !InfrastructureShared
-- Name: 1f078b8251461
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
