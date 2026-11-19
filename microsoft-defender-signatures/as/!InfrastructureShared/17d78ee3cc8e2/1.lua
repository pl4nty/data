-- Threat: !InfrastructureShared
-- Name: 17d78ee3cc8e2
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
