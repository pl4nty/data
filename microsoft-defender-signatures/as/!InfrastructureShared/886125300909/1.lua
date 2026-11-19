-- Threat: !InfrastructureShared
-- Name: 886125300909
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
