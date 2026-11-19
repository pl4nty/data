-- Threat: !InfrastructureShared
-- Name: 4578543088a0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
