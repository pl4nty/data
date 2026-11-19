-- Threat: !InfrastructureShared
-- Name: 2e7890d5f08d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
