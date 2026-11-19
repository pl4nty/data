-- Threat: !InfrastructureShared
-- Name: 8b7828593c72
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
