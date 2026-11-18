-- Threat: !InfrastructureShared
-- Name: 737875d5dd31
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
