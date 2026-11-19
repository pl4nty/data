-- Threat: !InfrastructureShared
-- Name: 5e78564336d2
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
