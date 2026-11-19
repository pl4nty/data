-- Threat: !InfrastructureShared
-- Name: 8378c4ca470c
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 50000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
