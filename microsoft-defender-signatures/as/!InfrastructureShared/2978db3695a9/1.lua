-- Threat: !InfrastructureShared
-- Name: 2978db3695a9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
