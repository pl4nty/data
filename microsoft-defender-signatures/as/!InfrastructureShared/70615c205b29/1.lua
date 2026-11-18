-- Threat: !InfrastructureShared
-- Name: 70615c205b29
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
