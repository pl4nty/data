-- Threat: !InfrastructureShared
-- Name: a378dcbbb019
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
