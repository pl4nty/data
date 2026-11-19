-- Threat: !InfrastructureShared
-- Name: 4ba78d40ad4fb
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
if hstrlog[12].matched then
  l_0_1 = l_0_1 + 1
end
local l_0_2 = 0
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
if hstrlog[18].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[19].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[20].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[21].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[22].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[23].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[24].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[25].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[26].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[27].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[28].matched then
  l_0_2 = l_0_2 + 1
end
if mp.getfilesize() < 60000 and (1 <= l_0_0 or l_0_1 == 10 or l_0_2 == 16) then
  return mp.INFECTED
end
return mp.CLEAN
