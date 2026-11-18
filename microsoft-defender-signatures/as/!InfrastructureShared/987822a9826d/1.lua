-- Threat: !InfrastructureShared
-- Name: 987822a9826d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
