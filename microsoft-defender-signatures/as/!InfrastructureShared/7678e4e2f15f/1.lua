-- Threat: !InfrastructureShared
-- Name: 7678e4e2f15f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
