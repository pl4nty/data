-- Threat: !InfrastructureShared
-- Name: 2b781056154e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
