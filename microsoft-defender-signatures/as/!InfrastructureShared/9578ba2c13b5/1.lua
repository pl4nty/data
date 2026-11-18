-- Threat: !InfrastructureShared
-- Name: 9578ba2c13b5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
