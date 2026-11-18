-- Threat: !InfrastructureShared
-- Name: 5478712e0cd1
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
