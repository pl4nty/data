-- Threat: !InfrastructureShared
-- Name: 797888a6bc45
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
