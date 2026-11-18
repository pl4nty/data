-- Threat: !InfrastructureShared
-- Name: 60786550cf14
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
