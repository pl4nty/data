-- Threat: !InfrastructureShared
-- Name: e278b83e1a30
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
