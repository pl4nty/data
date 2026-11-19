-- Threat: !InfrastructureShared
-- Name: 6278c00f15c2
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
