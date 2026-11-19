-- Threat: !InfrastructureShared
-- Name: 8a78421d0443
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
