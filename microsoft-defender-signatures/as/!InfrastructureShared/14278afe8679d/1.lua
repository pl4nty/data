-- Threat: !InfrastructureShared
-- Name: 14278afe8679d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
