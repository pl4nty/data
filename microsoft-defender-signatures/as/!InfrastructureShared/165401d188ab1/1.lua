-- Threat: !InfrastructureShared
-- Name: 165401d188ab1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
