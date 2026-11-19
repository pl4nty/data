-- Threat: !InfrastructureShared
-- Name: 11478275b6d23
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
