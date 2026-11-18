-- Threat: !InfrastructureShared
-- Name: 3d781b8090b6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
