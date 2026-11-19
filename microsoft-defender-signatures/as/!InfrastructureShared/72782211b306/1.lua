-- Threat: !InfrastructureShared
-- Name: 72782211b306
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
