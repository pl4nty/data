-- Threat: !InfrastructureShared
-- Name: d07897b0dc65
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
