-- Threat: !InfrastructureShared
-- Name: 10f78f5d33371
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
