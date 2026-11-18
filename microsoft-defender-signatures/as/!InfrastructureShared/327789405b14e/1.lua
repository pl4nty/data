-- Threat: !InfrastructureShared
-- Name: 327789405b14e
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[15].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[16].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[17].matched then
  l_0_1 = l_0_1 + 1
end
local l_0_2 = 0
if hstrlog[1].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[2].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[3].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[4].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[5].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[6].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[7].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[8].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[9].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[10].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[11].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[12].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[13].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[14].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[15].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[16].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[17].matched then
  l_0_2 = l_0_2 + 1
end
if mp.getfilesize() < 200000 and (hstrlog[1].matched or l_0_0 == 2 or l_0_1 == 3) or 8 <= l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
