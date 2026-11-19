-- Threat: !InfrastructureShared
-- Name: 1e6101a0153a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
