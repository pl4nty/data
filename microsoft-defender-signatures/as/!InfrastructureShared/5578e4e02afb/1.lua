-- Threat: !InfrastructureShared
-- Name: 5578e4e02afb
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 100000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
