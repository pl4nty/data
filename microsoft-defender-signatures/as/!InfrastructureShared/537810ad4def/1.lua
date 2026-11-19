-- Threat: !InfrastructureShared
-- Name: 537810ad4def
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
