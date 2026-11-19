-- Threat: !InfrastructureShared
-- Name: 2978ae7abba7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
