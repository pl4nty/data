-- Threat: !InfrastructureShared
-- Name: 17d7857bc4055
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
