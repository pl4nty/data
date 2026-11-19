-- Threat: !InfrastructureShared
-- Name: 7c7892e9c241
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
