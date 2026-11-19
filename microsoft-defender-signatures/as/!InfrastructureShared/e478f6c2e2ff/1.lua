-- Threat: !InfrastructureShared
-- Name: e478f6c2e2ff
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
