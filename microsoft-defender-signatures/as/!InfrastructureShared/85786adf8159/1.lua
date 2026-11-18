-- Threat: !InfrastructureShared
-- Name: 85786adf8159
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
