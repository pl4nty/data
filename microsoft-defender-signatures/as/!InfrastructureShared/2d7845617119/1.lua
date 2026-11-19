-- Threat: !InfrastructureShared
-- Name: 2d7845617119
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
