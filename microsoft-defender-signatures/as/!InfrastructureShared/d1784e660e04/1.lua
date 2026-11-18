-- Threat: !InfrastructureShared
-- Name: d1784e660e04
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
