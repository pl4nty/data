-- Threat: !InfrastructureShared
-- Name: 266783da3657b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
