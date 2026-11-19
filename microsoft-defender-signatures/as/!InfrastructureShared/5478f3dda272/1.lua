-- Threat: !InfrastructureShared
-- Name: 5478f3dda272
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
