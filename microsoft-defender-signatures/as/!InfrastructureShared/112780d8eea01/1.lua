-- Threat: !InfrastructureShared
-- Name: 112780d8eea01
-- Type: 21

local l_0_0 = hstrlog[3].matched and 1 or 0
local l_0_1 = hstrlog[2].matched and 1 or 0
local l_0_2 = mp.bitxor(l_0_0, l_0_1)
l_0_0 = hstrlog[6].matched and 1 or 0
l_0_1 = hstrlog[7].matched and 1 or 0
local l_0_3 = mp.bitxor(l_0_0, l_0_1)
if l_0_2 == 1 and l_0_3 == 1 and (peattributes.epscn_writable or peattributes.hasappendeddata) then
  return mp.INFECTED
end
return mp.CLEAN
