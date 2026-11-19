-- Threat: !InfrastructureShared
-- Name: a54092fbaffa
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
