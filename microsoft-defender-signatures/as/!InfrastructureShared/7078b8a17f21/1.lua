-- Threat: !InfrastructureShared
-- Name: 7078b8a17f21
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
