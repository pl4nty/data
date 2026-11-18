-- Threat: !InfrastructureShared
-- Name: 2e61dc53dc04
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
