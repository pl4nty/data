-- Threat: !InfrastructureShared
-- Name: 102783db9a35f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
