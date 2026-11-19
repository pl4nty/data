-- Threat: !InfrastructureShared
-- Name: e478e2807de5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
