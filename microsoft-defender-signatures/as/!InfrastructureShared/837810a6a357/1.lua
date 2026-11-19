-- Threat: !InfrastructureShared
-- Name: 837810a6a357
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
