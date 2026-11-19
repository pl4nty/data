-- Threat: !InfrastructureShared
-- Name: c378ebbdb681
-- Type: 21
-- Flags: 1

local l_0_0 = hstrlog[5].matched
local l_0_1 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched
local l_0_2 = hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched
if l_0_0 and l_0_1 and l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
