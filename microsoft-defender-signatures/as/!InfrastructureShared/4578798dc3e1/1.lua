-- Threat: !InfrastructureShared
-- Name: 4578798dc3e1
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
