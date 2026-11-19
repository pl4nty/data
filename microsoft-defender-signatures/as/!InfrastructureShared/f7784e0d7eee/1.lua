-- Threat: !InfrastructureShared
-- Name: f7784e0d7eee
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
