-- Threat: !InfrastructureShared
-- Name: f378b0f3545d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
