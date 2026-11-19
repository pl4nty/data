-- Threat: !InfrastructureShared
-- Name: 7778cabf1c7d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
