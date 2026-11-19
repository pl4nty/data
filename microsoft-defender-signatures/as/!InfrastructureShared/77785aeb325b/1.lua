-- Threat: !InfrastructureShared
-- Name: 77785aeb325b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
