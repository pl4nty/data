-- Threat: !InfrastructureShared
-- Name: 192781c934127
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
