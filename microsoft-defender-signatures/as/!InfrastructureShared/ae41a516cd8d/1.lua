-- Threat: !InfrastructureShared
-- Name: ae41a516cd8d
-- Type: 21

if mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
