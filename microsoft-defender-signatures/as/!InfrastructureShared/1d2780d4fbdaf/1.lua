-- Threat: !InfrastructureShared
-- Name: 1d2780d4fbdaf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
