-- Threat: !InfrastructureShared
-- Name: 1427886a0fdf3
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
if mp.getfilesize() < 900000 and l_0_0 == 2 and 1 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
