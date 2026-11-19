-- Threat: !InfrastructureShared
-- Name: 5378e97d2308
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
