-- Threat: !InfrastructureShared
-- Name: ac78ca9f5c1b
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
