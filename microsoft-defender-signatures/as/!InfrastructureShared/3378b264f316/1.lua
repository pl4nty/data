-- Threat: !InfrastructureShared
-- Name: 3378b264f316
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
