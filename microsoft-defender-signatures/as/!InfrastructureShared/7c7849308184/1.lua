-- Threat: !InfrastructureShared
-- Name: 7c7849308184
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 800000 and hstrlog[1].matched and not hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
