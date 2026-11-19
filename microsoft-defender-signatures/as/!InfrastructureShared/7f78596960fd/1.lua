-- Threat: !InfrastructureShared
-- Name: 7f78596960fd
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
