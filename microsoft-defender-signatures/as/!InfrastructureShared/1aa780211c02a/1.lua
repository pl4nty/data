-- Threat: !InfrastructureShared
-- Name: 1aa780211c02a
-- Type: 21

if mp.getfilesize() < 7340032 then
  return mp.INFECTED
end
return mp.CLEAN
