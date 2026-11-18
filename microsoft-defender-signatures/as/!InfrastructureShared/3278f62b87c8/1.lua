-- Threat: !InfrastructureShared
-- Name: 3278f62b87c8
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
