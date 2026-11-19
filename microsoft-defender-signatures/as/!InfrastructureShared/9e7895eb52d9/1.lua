-- Threat: !InfrastructureShared
-- Name: 9e7895eb52d9
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
