-- Threat: !InfrastructureShared
-- Name: 105405085069d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
