-- Threat: !InfrastructureShared
-- Name: b278726d1177
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
