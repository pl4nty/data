-- Threat: !InfrastructureShared
-- Name: 56789245d058
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
