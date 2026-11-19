-- Threat: !InfrastructureShared
-- Name: 7b784212ca8e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
