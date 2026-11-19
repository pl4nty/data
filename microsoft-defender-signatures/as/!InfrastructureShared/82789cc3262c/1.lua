-- Threat: !InfrastructureShared
-- Name: 82789cc3262c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
