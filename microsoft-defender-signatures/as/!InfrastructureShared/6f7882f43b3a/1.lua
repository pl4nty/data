-- Threat: !InfrastructureShared
-- Name: 6f7882f43b3a
-- Type: 21

if mp.getfilesize() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN
