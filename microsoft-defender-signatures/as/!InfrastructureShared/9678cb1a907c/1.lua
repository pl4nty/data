-- Threat: !InfrastructureShared
-- Name: 9678cb1a907c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
