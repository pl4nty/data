-- Threat: !InfrastructureShared
-- Name: e5405046e083
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
