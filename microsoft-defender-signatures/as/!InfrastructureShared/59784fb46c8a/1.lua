-- Threat: !InfrastructureShared
-- Name: 59784fb46c8a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
