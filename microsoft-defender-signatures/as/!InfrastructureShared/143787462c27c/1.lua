-- Threat: !InfrastructureShared
-- Name: 143787462c27c
-- Type: 21
-- Flags: 1

local l_0_0 = hstrlog[1].matched or hstrlog[3].matched or hstrlog[2].matched
local l_0_1 = hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched
if l_0_0 and l_0_1 then
  return mp.INFECTED
end
if 1 <= mp.HSTR_WEIGHT then
  return mp.LOWFI
end
return mp.CLEAN
