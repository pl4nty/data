-- Threat: !InfrastructureShared
-- Name: 4278e51978d2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
