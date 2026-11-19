-- Threat: !InfrastructureShared
-- Name: 3b785f60a36f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
