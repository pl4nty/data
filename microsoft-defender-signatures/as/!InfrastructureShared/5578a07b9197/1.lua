-- Threat: !InfrastructureShared
-- Name: 5578a07b9197
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
