-- Threat: !InfrastructureShared
-- Name: 14678dcda8d5c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
