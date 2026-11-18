-- Threat: !InfrastructureShared
-- Name: 89786e52b34c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
