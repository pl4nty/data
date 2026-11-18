-- Threat: !InfrastructureShared
-- Name: 6c78c38fe50c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
