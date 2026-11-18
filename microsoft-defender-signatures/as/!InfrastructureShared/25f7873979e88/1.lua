-- Threat: !InfrastructureShared
-- Name: 25f7873979e88
-- Type: 21
-- Flags: 1

local r0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched
local r0_1 = (hstrlog[5].matched or hstrlog[7].matched or hstrlog[9].matched)
  and (hstrlog[6].matched or hstrlog[8].matched or hstrlog[10].matched)
local r0_2 = hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched
local r0_3 = hstrlog[11].matched
  or hstrlog[12].matched
  or hstrlog[13].matched
  or hstrlog[14].matched
  or hstrlog[15].matched
  or hstrlog[16].matched
  or hstrlog[17].matched
  or hstrlog[18].matched
  or hstrlog[19].matched
  or hstrlog[20].matched
  or hstrlog[21].matched
  or hstrlog[22].matched
  or hstrlog[23].matched
  or hstrlog[24].matched
local r0_4 = 0
if r0_0 or r0_1 then
  r0_4 = r0_4 + 2
end
if r0_2 then
  r0_4 = r0_4 + 1
end
if r0_3 then
  r0_4 = r0_4 + 1
end
if r0_4 == 4 then
  return mp.INFECTED
end
if r0_4 >= 3 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
