-- Threat: !InfrastructureShared
-- Name: 6f8f0384634c
-- Type: 21

if mp.getfilesize() < 307200 then
  return mp.INFECTED
end
return mp.CLEAN
