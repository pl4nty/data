-- Threat: !InfrastructureShared
-- Name: 68789c3d458a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
