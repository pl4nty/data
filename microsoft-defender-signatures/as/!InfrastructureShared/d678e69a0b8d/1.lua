-- Threat: !InfrastructureShared
-- Name: d678e69a0b8d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
