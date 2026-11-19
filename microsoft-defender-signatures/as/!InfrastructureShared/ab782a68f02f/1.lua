-- Threat: !InfrastructureShared
-- Name: ab782a68f02f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
