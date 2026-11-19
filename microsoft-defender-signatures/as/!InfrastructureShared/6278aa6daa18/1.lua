-- Threat: !InfrastructureShared
-- Name: 6278aa6daa18
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
