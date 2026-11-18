-- Threat: !InfrastructureShared
-- Name: 70782e4190f2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
