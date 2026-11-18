-- Threat: !InfrastructureShared
-- Name: 657847d68098
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = (hstrlog[3].matched and 1 or 0) + (hstrlog[4].matched and 1 or 0) + (hstrlog[5].matched and 1 or 0)
if 2 <= l_0_1 and l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
