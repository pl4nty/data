-- Threat: !InfrastructureShared
-- Name: e578574904d5
-- Type: 21
-- Flags: 1

local l_0_0 = hstrlog[1].matched
local l_0_1 = hstrlog[2].matched
local l_0_2 = hstrlog[3].matched or hstrlog[4].matched
local l_0_3 = hstrlog[5].matched or hstrlog[6].matched
local l_0_4 = hstrlog[7].matched or hstrlog[8].matched
local l_0_5 = hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched
local l_0_6 = 0
if l_0_5 then
  l_0_6 = l_0_6 + 1
end
if l_0_3 and l_0_4 then
  l_0_6 = l_0_6 + 2
end
if l_0_1 and l_0_2 then
  l_0_6 = l_0_6 + 2
end
if l_0_0 then
  l_0_6 = l_0_6 + 1
end
if 3 <= l_0_6 then
  mp.set_mpattribute("HSTR:Win32/Vobfus.gen!Y")
end
if 6 <= l_0_6 then
  return mp.INFECTED
end
if 4 <= l_0_6 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
