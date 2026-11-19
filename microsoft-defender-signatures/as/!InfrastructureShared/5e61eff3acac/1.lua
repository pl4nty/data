-- Threat: !InfrastructureShared
-- Name: 5e61eff3acac
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
