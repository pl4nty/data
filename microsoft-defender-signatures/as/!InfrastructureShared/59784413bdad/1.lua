-- Threat: !InfrastructureShared
-- Name: 59784413bdad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
