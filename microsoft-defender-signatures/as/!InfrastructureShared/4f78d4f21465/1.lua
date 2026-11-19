-- Threat: !InfrastructureShared
-- Name: 4f78d4f21465
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
