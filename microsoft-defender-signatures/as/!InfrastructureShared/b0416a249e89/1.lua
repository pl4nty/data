-- Threat: !InfrastructureShared
-- Name: b0416a249e89
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
