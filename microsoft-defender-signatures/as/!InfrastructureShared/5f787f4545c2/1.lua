-- Threat: !InfrastructureShared
-- Name: 5f787f4545c2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
