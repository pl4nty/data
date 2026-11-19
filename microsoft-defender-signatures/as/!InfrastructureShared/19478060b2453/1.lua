-- Threat: !InfrastructureShared
-- Name: 19478060b2453
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
