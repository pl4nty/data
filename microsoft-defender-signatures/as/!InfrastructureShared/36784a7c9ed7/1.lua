-- Threat: !InfrastructureShared
-- Name: 36784a7c9ed7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
