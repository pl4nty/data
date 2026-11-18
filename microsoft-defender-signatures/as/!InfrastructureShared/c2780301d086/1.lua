-- Threat: !InfrastructureShared
-- Name: c2780301d086
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
