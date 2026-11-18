-- Threat: !InfrastructureShared
-- Name: e54030aa0518
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
