-- Threat: !InfrastructureShared
-- Name: 20578d213b2f9
-- Type: 21

local l_0_0 = hstrlog[1].matched and hstrlog[2].matched
local l_0_1 = hstrlog[3].matched and hstrlog[4].matched
local l_0_2 = hstrlog[5].matched and hstrlog[6].matched
local l_0_3 = hstrlog[7].matched and hstrlog[8].matched
if l_0_0 and (l_0_1 or l_0_2 or l_0_3) then
  return mp.INFECTED
end
if 3 <= mp.HSTR_WEIGHT then
  return mp.LOWFI
end
return mp.CLEAN
