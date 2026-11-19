-- Threat: !InfrastructureShared
-- Name: 9c781f9e1177
-- Type: 21

if peattributes.ismsil == false and peattributes.isvbnative == false then
  return mp.INFECTED
end
return mp.CLEAN
