-- Threat: !InfrastructureShared
-- Name: 19478e5161410
-- Type: 21

if mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
