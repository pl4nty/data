-- Threat: !InfrastructureShared
-- Name: 8c786a21a407
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
