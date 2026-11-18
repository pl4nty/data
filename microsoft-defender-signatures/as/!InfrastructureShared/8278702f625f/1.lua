-- Threat: !InfrastructureShared
-- Name: 8278702f625f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
