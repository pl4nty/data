-- Threat: !InfrastructureShared
-- Name: 13178edeb1a63
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched
local l_0_1 = hstrlog[5].matched or hstrlog[7].matched or hstrlog[6].matched
local l_0_2 = hstrlog[8].matched or hstrlog[9].matched
local l_0_3 = hstrlog[10].matched or hstrlog[11].matched
local l_0_4 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0)
if 3 <= l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
