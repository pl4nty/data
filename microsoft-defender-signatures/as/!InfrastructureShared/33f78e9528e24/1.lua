-- Threat: !InfrastructureShared
-- Name: 33f78e9528e24
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[7].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[8].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[9].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[10].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[11].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[12].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[13].matched then
  l_0_1 = l_0_1 + 1
end
if mp.getfilesize() < 250000 and (hstrlog[1].matched or hstrlog[2].matched and 6 <= l_0_0 or 6 <= l_0_0 and l_0_1 == 3) then
  return mp.INFECTED
end
return mp.CLEAN
