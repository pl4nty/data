-- Threat: !InfrastructureShared
-- Name: 45785ebe19cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
