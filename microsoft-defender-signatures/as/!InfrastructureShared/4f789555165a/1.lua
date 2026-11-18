-- Threat: !InfrastructureShared
-- Name: 4f789555165a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
