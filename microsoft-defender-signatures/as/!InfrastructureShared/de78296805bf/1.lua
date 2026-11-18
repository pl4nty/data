-- Threat: !InfrastructureShared
-- Name: de78296805bf
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
