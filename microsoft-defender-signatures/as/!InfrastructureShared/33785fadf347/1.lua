-- Threat: !InfrastructureShared
-- Name: 33785fadf347
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
