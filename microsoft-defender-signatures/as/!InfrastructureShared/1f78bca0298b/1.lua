-- Threat: !InfrastructureShared
-- Name: 1f78bca0298b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
