-- Threat: !InfrastructureShared
-- Name: 3d78b095e783
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
