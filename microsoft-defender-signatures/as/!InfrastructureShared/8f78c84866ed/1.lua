-- Threat: !InfrastructureShared
-- Name: 8f78c84866ed
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
