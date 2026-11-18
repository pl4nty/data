-- Threat: !InfrastructureShared
-- Name: ac78c0717a36
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
