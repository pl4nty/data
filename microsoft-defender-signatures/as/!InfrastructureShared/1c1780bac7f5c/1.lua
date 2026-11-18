-- Threat: !InfrastructureShared
-- Name: 1c1780bac7f5c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
