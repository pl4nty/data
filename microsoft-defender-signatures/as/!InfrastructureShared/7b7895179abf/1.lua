-- Threat: !InfrastructureShared
-- Name: 7b7895179abf
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
