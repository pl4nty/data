-- Threat: !InfrastructureShared
-- Name: 58788512f09c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
