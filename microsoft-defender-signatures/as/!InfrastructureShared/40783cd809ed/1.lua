-- Threat: !InfrastructureShared
-- Name: 40783cd809ed
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
