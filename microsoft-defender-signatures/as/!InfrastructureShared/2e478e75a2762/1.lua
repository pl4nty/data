-- Threat: !InfrastructureShared
-- Name: 2e478e75a2762
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
