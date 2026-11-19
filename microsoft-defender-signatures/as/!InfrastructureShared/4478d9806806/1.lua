-- Threat: !InfrastructureShared
-- Name: 4478d9806806
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 3000000 and hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
  return mp.INFECTED
end
return mp.CLEAN
