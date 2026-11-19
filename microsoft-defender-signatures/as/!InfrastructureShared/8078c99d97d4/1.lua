-- Threat: !InfrastructureShared
-- Name: 8078c99d97d4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
