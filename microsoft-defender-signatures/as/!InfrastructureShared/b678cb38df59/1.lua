-- Threat: !InfrastructureShared
-- Name: b678cb38df59
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
if hstrlog[5].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[6].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[7].matched then
  l_0_1 = l_0_1 + 1
end
if mp.getfilesize() < 10000 and hstrlog[4].matched and hstrlog[3].matched and l_0_0 == 2 and l_0_1 == 3 then
  return mp.INFECTED
end
return mp.CLEAN
