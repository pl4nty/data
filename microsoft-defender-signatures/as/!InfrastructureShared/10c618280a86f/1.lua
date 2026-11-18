-- Threat: !InfrastructureShared
-- Name: 10c618280a86f
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
