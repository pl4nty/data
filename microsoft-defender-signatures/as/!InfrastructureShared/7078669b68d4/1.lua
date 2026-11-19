-- Threat: !InfrastructureShared
-- Name: 7078669b68d4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
