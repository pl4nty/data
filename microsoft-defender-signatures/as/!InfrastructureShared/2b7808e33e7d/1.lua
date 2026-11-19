-- Threat: !InfrastructureShared
-- Name: 2b7808e33e7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
