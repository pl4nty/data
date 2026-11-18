-- Threat: !InfrastructureShared
-- Name: 797899713a9b
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
