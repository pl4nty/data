-- Threat: !InfrastructureShared
-- Name: 4d7851cb8a3d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
