-- Threat: !InfrastructureShared
-- Name: 4678ff9ac42c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
