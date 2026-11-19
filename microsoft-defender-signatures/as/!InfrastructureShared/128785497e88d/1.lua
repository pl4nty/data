-- Threat: !InfrastructureShared
-- Name: 128785497e88d
-- Type: 21

if peattributes.hasstandardentry then
  return mp.CLEAN
end
local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = hstrlog[3].matched and hstrlog[4].matched
local l_0_2 = hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched
local l_0_3 = hstrlog[9].matched or hstrlog[10].matched
local l_0_4 = hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched
local l_0_5 = hstrlog[15].matched or hstrlog[16].matched
local l_0_6 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0) + (l_0_4 and 1 or 0) + (l_0_5 and 1 or 0)
if 3 <= l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
