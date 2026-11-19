-- Threat: !InfrastructureShared
-- Name: 6c78a1b27e64
-- Type: 21

if mp.getfilesize() > 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
