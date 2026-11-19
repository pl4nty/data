-- Threat: !InfrastructureShared
-- Name: 3c7820e1958a
-- Type: 21
-- Flags: 1

mp.readprotection(false)
local l_0_0 = mp.readfile(0, mp.getfilesize() < 4096 and mp.getfilesize() or 4096)
local l_0_1 = 4096 > hstrlog[1].VA + 329 and mp.readu_u32(l_0_0, hstrlog[1].VA + 329 + 1) or 8192
local l_0_2 = 4096 > hstrlog[1].VA + 381 and mp.readu_u32(l_0_0, hstrlog[1].VA + 381 + 1) or 8192
local l_0_3 = 4096 > hstrlog[1].VA + 609 and mp.readu_u32(l_0_0, hstrlog[1].VA + 609 + 1) or 8192
local l_0_4 = 4096 > hstrlog[1].VA + 819 and mp.readu_u32(l_0_0, hstrlog[1].VA + 819 + 1) or 8192
local l_0_5 = 4096 > hstrlog[1].VA + 843 and mp.readu_u32(l_0_0, hstrlog[1].VA + 843 + 1) or 8192
local l_0_6 = 4096 > hstrlog[1].VA + 971 and mp.readu_u32(l_0_0, hstrlog[1].VA + 971 + 1) or 8192
if l_0_1 == 3842003712 and l_0_2 == 117450240 and l_0_3 == 3372260352 and l_0_4 == 1442882048 and l_0_5 == 3758109952 and l_0_6 == 3422588416 then
  return mp.INFECTED
end
return mp.CLEAN
