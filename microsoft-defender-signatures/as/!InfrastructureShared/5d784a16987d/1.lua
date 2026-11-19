-- Threat: !InfrastructureShared
-- Name: 5d784a16987d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
