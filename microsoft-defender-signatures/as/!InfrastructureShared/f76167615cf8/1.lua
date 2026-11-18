-- Threat: !InfrastructureShared
-- Name: f76167615cf8
-- Type: 21

local l_0_0 = hstrlog[1].matched and hstrlog[2].matched
local l_0_1 = hstrlog[3].matched and hstrlog[4].matched and hstrlog[5].matched and hstrlog[6].matched and hstrlog[7].matched
local l_0_2 = hstrlog[8].matched and hstrlog[9].matched and hstrlog[10].matched
if peattributes.ismsil == true and (l_0_0 or l_0_1 or l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
