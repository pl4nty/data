-- Threat: !InfrastructureShared
-- Name: 3d7839ca23e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
