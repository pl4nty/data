-- Threat: !InfrastructureShared
-- Name: 837836240bac
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
