-- Threat: !InfrastructureShared
-- Name: 98782fb84aa4
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[1].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[2].matched then
  l_0_1 = l_0_1 + 1
end
if mp.getfilesize() < 200000 and 1 <= l_0_0 or l_0_1 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
