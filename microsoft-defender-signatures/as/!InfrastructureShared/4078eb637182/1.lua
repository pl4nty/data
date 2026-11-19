-- Threat: !InfrastructureShared
-- Name: 4078eb637182
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
