-- Threat: !InfrastructureShared
-- Name: ac788a1bcace
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
