-- Threat: !InfrastructureShared
-- Name: 3f7881b097fc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
