-- Threat: !InfrastructureShared
-- Name: b078272e3abd
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
