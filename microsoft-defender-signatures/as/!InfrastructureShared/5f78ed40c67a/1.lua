-- Threat: !InfrastructureShared
-- Name: 5f78ed40c67a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
