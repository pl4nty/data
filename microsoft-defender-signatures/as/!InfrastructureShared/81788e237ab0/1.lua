-- Threat: !InfrastructureShared
-- Name: 81788e237ab0
-- Type: 21

if peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
