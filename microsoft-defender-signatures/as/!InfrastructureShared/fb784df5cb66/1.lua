-- Threat: !InfrastructureShared
-- Name: fb784df5cb66
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
