-- Threat: !InfrastructureShared
-- Name: 2f7839e4a6e2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
