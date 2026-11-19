-- Threat: !InfrastructureShared
-- Name: 16c8cccd73c36
-- Type: 21

if mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
