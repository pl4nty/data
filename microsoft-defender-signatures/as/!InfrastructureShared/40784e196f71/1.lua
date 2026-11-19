-- Threat: !InfrastructureShared
-- Name: 40784e196f71
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
