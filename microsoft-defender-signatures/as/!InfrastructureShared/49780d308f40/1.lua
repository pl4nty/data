-- Threat: !InfrastructureShared
-- Name: 49780d308f40
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
