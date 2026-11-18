-- Threat: !InfrastructureShared
-- Name: 9878ba708f16
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
