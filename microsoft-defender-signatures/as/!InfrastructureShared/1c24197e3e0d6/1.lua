-- Threat: !InfrastructureShared
-- Name: 1c24197e3e0d6
-- Type: 21

if mp.getfilesize() <= 2048 then
  return mp.INFECTED
end
return mp.CLEAN
