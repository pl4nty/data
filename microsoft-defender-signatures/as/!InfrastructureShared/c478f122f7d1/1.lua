-- Threat: !InfrastructureShared
-- Name: c478f122f7d1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
