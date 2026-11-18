-- Threat: !InfrastructureShared
-- Name: 3d782d40db56
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
