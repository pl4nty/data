-- Threat: !InfrastructureShared
-- Name: 91789c269563
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 500000 and hstrlog[1].matched and 1 <= not l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
