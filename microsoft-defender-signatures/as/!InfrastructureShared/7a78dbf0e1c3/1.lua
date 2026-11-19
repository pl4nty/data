-- Threat: !InfrastructureShared
-- Name: 7a78dbf0e1c3
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
