-- Threat: !InfrastructureShared
-- Name: 668c9c396380
-- Type: 21

if mp.getfilesize() < 16384 then
  return mp.INFECTED
end
return mp.CLEAN
