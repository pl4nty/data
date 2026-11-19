-- Threat: !InfrastructureShared
-- Name: 115400e437b10
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
