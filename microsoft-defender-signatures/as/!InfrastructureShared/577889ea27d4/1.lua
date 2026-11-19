-- Threat: !InfrastructureShared
-- Name: 577889ea27d4
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 200000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
