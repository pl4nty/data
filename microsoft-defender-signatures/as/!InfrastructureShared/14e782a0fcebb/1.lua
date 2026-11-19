-- Threat: !InfrastructureShared
-- Name: 14e782a0fcebb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
