-- Threat: !InfrastructureShared
-- Name: ca2966c40287
-- Type: 21

if mp.getfilesize() <= 700 and mp.getfilesize() > 2048 then
  return mp.INFECTED
end
return mp.CLEAN
