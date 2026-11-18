-- Threat: !InfrastructureShared
-- Name: 12e78d0c3708e
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[6].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[7].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[8].matched then
  l_0_1 = l_0_1 + 1
end
if mp.getfilesize() < 5000000 and (l_0_0 == 4 and (hstrlog[1].matched or 1 <= l_0_1) or l_0_1 == 3) then
  return mp.INFECTED
end
return mp.CLEAN
