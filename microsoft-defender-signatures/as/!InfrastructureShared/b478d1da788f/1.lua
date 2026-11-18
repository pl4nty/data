-- Threat: !InfrastructureShared
-- Name: b478d1da788f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
