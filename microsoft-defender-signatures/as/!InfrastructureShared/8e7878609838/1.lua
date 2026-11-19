-- Threat: !InfrastructureShared
-- Name: 8e7878609838
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
