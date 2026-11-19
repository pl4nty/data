-- Threat: !InfrastructureShared
-- Name: e178bdbeed65
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
