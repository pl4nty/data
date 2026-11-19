-- Threat: !InfrastructureShared
-- Name: 357865268635
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
