-- Threat: !InfrastructureShared
-- Name: 57783442b752
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
