-- Threat: !InfrastructureShared
-- Name: 81785c23beee
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
