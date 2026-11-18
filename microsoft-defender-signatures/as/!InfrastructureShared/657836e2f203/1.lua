-- Threat: !InfrastructureShared
-- Name: 657836e2f203
-- Type: 21

mp.set_mpattribute("HSTR:ZwangiExe")
local l_0_0 = hstrlog[1].matched
local l_0_1 = hstrlog[2].matched
local l_0_2 = hstrlog[3].matched
local l_0_3 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0)
if 3 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
