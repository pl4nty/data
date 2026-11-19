-- Threat: !InfrastructureShared
-- Name: b6789b6e8c48
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
