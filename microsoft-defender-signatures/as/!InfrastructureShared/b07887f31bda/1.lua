-- Threat: !InfrastructureShared
-- Name: b07887f31bda
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
