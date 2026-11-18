-- Threat: !InfrastructureShared
-- Name: 79787a12d628
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
