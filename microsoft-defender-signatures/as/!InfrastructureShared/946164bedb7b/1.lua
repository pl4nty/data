-- Threat: !InfrastructureShared
-- Name: 946164bedb7b
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
