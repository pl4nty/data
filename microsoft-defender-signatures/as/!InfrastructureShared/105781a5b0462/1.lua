-- Threat: !InfrastructureShared
-- Name: 105781a5b0462
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
