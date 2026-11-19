-- Threat: !InfrastructureShared
-- Name: ee78a51a9e76
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
