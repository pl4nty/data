-- Threat: !InfrastructureShared
-- Name: 4978b5306f84
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
