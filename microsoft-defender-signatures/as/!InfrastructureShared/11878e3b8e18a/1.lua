-- Threat: !InfrastructureShared
-- Name: 11878e3b8e18a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
