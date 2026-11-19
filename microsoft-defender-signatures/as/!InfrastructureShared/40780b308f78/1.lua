-- Threat: !InfrastructureShared
-- Name: 40780b308f78
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
