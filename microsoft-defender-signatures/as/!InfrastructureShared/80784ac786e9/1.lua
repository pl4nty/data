-- Threat: !InfrastructureShared
-- Name: 80784ac786e9
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
