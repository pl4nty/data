-- Threat: !InfrastructureShared
-- Name: 7078e56198b8
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
