-- Threat: !InfrastructureShared
-- Name: 13e78b7a03fa7
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[1].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[2].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[3].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[4].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[5].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[6].matched then
  l_0_1 = l_0_1 + 1
end
if mp.getfilesize() < 100000 and (1 <= l_0_0 or 3 <= l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
