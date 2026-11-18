-- Threat: !InfrastructureShared
-- Name: 88789dbf4296
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
