-- Threat: !InfrastructureShared
-- Name: 70781902d098
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
