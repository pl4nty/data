-- Threat: !InfrastructureShared
-- Name: 36789d611012
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
