-- Threat: !InfrastructureShared
-- Name: 8a7814fc6308
-- Type: 21

if mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
