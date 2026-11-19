-- Threat: !InfrastructureShared
-- Name: 6c7865e48326
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
