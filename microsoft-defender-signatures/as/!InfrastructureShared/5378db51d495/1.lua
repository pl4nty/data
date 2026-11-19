-- Threat: !InfrastructureShared
-- Name: 5378db51d495
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
