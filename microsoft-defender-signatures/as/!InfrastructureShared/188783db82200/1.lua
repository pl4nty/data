-- Threat: !InfrastructureShared
-- Name: 188783db82200
-- Type: 21

mp.set_mpattribute("HSTR:Worm:MSIL/Murkados.A")
local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched
local l_0_1 = hstrlog[4].matched or hstrlog[5].matched
local l_0_2 = hstrlog[6].matched
local l_0_3 = hstrlog[7].matched
local l_0_4 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0)
if 3 <= l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
