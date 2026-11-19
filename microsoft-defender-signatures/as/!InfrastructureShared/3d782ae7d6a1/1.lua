-- Threat: !InfrastructureShared
-- Name: 3d782ae7d6a1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
