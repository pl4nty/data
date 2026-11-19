-- Threat: !InfrastructureShared
-- Name: 87789b3d2fe2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
