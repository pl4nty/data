-- Threat: !InfrastructureShared
-- Name: 95407a499d0a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
