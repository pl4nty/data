-- Threat: !InfrastructureShared
-- Name: b261978f8635
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
