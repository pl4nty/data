-- Threat: !InfrastructureShared
-- Name: 5678bf36ad24
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
