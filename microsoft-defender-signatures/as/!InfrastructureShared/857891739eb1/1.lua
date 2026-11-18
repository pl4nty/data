-- Threat: !InfrastructureShared
-- Name: 857891739eb1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
