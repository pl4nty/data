-- Threat: !InfrastructureShared
-- Name: 89786fd84103
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
