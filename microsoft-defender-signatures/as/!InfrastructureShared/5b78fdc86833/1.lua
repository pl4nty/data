-- Threat: !InfrastructureShared
-- Name: 5b78fdc86833
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
