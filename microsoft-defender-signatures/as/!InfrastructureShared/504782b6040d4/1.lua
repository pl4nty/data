-- Threat: !InfrastructureShared
-- Name: 504782b6040d4
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
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
if hstrlog[7].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[8].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[9].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[10].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[11].matched then
  l_0_1 = l_0_1 + 1
end
if mp.getfilesize() < 700000 and 1 <= l_0_0 or 5 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
