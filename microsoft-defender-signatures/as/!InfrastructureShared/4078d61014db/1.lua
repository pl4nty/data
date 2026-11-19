-- Threat: !InfrastructureShared
-- Name: 4078d61014db
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
