-- Threat: !InfrastructureShared
-- Name: 3b78a5f02a4c
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
