-- Threat: !InfrastructureShared
-- Name: 92786d052588
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
