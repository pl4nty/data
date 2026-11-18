-- Threat: !InfrastructureShared
-- Name: 31782b56c791
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
