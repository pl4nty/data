-- Threat: !InfrastructureShared
-- Name: 38785f75208d
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
