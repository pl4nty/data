-- Threat: !InfrastructureShared
-- Name: 78789306b093
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
