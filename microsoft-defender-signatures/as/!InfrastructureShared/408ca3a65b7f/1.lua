-- Threat: !InfrastructureShared
-- Name: 408ca3a65b7f
-- Type: 21

if mp.getfilesize() <= 12288 then
  return mp.INFECTED
end
return mp.CLEAN
