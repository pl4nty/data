-- Threat: !InfrastructureShared
-- Name: 85784af1c08f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
