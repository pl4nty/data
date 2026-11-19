-- Threat: !InfrastructureShared
-- Name: 17d78e0b241b4
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
