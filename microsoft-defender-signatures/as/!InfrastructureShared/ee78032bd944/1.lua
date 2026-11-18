-- Threat: !InfrastructureShared
-- Name: ee78032bd944
-- Type: 21

local l_0_0 = hstrlog[1].matched and 1 or 0
local l_0_1 = hstrlog[2].matched and 1 or 0
local l_0_2 = mp.bitxor(l_0_0, l_0_1)
if l_0_2 ~= 0 then
  return mp.INFECTED
end
return mp.CLEAN
