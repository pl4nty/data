-- Threat: !InfrastructureShared
-- Name: b87861b8ab66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
