-- Threat: !InfrastructureShared
-- Name: 45789f268c62
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
