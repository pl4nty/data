-- Threat: !InfrastructureShared
-- Name: 59780f39ff99
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
