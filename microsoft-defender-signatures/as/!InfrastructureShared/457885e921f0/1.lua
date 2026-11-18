-- Threat: !InfrastructureShared
-- Name: 457885e921f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
