-- Threat: !InfrastructureShared
-- Name: 1247856b9c516
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = hstrlog[3].matched
local l_0_2 = hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched
local l_0_3 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0)
if 3 <= l_0_3 and 6 <= mp.HSTR_WEIGHT then
  return mp.INFECTED
end
return mp.CLEAN
