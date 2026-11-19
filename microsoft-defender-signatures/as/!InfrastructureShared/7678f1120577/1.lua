-- Threat: !InfrastructureShared
-- Name: 7678f1120577
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
