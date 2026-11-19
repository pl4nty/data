-- Threat: !InfrastructureShared
-- Name: 5878bb86a667
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
