-- Threat: !InfrastructureShared
-- Name: 17378e78612ad
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
