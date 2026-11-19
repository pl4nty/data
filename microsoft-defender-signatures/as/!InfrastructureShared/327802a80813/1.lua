-- Threat: !InfrastructureShared
-- Name: 327802a80813
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
