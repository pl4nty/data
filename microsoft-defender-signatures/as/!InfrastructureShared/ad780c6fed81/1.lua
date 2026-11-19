-- Threat: !InfrastructureShared
-- Name: ad780c6fed81
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
