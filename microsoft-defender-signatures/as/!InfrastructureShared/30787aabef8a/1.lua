-- Threat: !InfrastructureShared
-- Name: 30787aabef8a
-- Type: 21

if mp.getfilesize() >= 133376 and mp.getfilesize() <= 135424 then
  return mp.INFECTED
end
return mp.CLEAN
