-- Threat: !InfrastructureShared
-- Name: 5c786322fd87
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
