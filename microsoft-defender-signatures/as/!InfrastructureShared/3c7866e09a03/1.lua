-- Threat: !InfrastructureShared
-- Name: 3c7866e09a03
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
