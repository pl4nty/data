-- Threat: !InfrastructureShared
-- Name: 3778b73f64e9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
