-- Threat: !InfrastructureShared
-- Name: 2578b085e75a
-- Type: 21
-- Flags: 1

mp.readprotection(false)
local l_0_0 = mp.readfile(0, mp.getfilesize() < 4096 and mp.getfilesize() or 4096)
local l_0_1 = 4096 > hstrlog[1].VA + 163 and mp.readu_u32(l_0_0, hstrlog[1].VA + 163 + 1) or 8192
local l_0_2 = 4096 > hstrlog[1].VA + 189 and mp.readu_u32(l_0_0, hstrlog[1].VA + 189 + 1) or 8192
local l_0_3 = 4096 > hstrlog[1].VA + 303 and mp.readu_u32(l_0_0, hstrlog[1].VA + 303 + 1) or 8192
local l_0_4 = 4096 > hstrlog[1].VA + 408 and mp.readu_u32(l_0_0, hstrlog[1].VA + 408 + 1) or 8192
local l_0_5 = 4096 > hstrlog[1].VA + 420 and mp.readu_u32(l_0_0, hstrlog[1].VA + 420 + 1) or 8192
local l_0_6 = 4096 > hstrlog[1].VA + 484 and mp.readu_u32(l_0_0, hstrlog[1].VA + 484 + 1) or 8192
if l_0_1 == 3847464024 and l_0_2 == 119961420 and l_0_3 == 3382495594 and l_0_4 == 1453503984 and l_0_5 == 3761631300 and l_0_6 == 3431858420 then
  return mp.INFECTED
end
return mp.CLEAN
