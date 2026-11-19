-- Threat: !InfrastructureShared
-- Name: 9540447b0108
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
