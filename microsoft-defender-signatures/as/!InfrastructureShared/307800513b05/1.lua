-- Threat: !InfrastructureShared
-- Name: 307800513b05
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
