-- Threat: !InfrastructureShared
-- Name: ff781ff03852
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched
local l_0_2 = hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched
local l_0_3 = hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched
local l_0_4 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0)
if 4 <= l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
