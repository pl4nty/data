-- Threat: !InfrastructureShared
-- Name: 20d6105c05516
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
