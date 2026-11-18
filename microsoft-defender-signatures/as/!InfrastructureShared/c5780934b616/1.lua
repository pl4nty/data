-- Threat: !InfrastructureShared
-- Name: c5780934b616
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
if mp.getfilesize() < 50000 and l_0_0 == 2 or l_0_1 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
