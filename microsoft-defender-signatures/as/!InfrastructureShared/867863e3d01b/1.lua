-- Threat: !InfrastructureShared
-- Name: 867863e3d01b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
