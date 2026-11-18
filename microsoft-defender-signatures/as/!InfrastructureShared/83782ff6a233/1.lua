-- Threat: !InfrastructureShared
-- Name: 83782ff6a233
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
