-- Threat: !InfrastructureShared
-- Name: 3778c14fb4f6
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 100000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
