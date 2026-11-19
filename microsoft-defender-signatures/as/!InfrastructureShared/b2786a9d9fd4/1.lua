-- Threat: !InfrastructureShared
-- Name: b2786a9d9fd4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
