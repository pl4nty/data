-- Threat: !InfrastructureShared
-- Name: 42782dd8b05d
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
