-- Threat: !InfrastructureShared
-- Name: 79782a1de040
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
