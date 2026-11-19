-- Threat: !InfrastructureShared
-- Name: 5b7806448386
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
