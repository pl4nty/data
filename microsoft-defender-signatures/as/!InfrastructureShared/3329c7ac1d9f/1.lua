-- Threat: !InfrastructureShared
-- Name: 3329c7ac1d9f
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
end
return mp.CLEAN
