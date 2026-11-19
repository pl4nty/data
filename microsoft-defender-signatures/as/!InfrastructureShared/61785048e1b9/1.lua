-- Threat: !InfrastructureShared
-- Name: 61785048e1b9
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
