-- Threat: !InfrastructureShared
-- Name: 3c78f9275555
-- Type: 21
-- Flags: 1

mp.readprotection(false)
local l_0_0 = mp.readfile(0, mp.getfilesize() < 4096 and mp.getfilesize() or 4096)
local l_0_1 = 4096 > hstrlog[1].VA + 515 and mp.readu_u32(l_0_0, hstrlog[1].VA + 515 + 1) or 8192
local l_0_2 = 4096 > hstrlog[1].VA + 549 and mp.readu_u32(l_0_0, hstrlog[1].VA + 549 + 1) or 8192
local l_0_3 = 4096 > hstrlog[1].VA + 605 and mp.readu_u32(l_0_0, hstrlog[1].VA + 605 + 1) or 8192
local l_0_4 = 4096 > hstrlog[1].VA + 647 and mp.readu_u32(l_0_0, hstrlog[1].VA + 647 + 1) or 8192
local l_0_5 = 4096 > hstrlog[1].VA + 675 and mp.readu_u32(l_0_0, hstrlog[1].VA + 675 + 1) or 8192
local l_0_6 = 4096 > hstrlog[1].VA + 709 and mp.readu_u32(l_0_0, hstrlog[1].VA + 709 + 1) or 8192
local l_0_7 = 4096 > hstrlog[1].VA + 737 and mp.readu_u32(l_0_0, hstrlog[1].VA + 737 + 1) or 8192
local l_0_8 = 4096 > hstrlog[1].VA + 819 and mp.readu_u32(l_0_0, hstrlog[1].VA + 819 + 1) or 8192
local l_0_9 = 4096 > hstrlog[1].VA + 883 and mp.readu_u32(l_0_0, hstrlog[1].VA + 883 + 1) or 8192
local l_0_10 = 4096 > hstrlog[1].VA + 935 and mp.readu_u32(l_0_0, hstrlog[1].VA + 935 + 1) or 8192
local l_0_11 = 4096 > hstrlog[1].VA + 991 and mp.readu_u32(l_0_0, hstrlog[1].VA + 991 + 1) or 8192
if l_0_1 == 117450240 and l_0_2 == 27392 and l_0_3 == 3758153472 and l_0_4 == 1728067328 and l_0_5 == 4278204416 and l_0_6 == 3774888704 and l_0_7 == 1627409664 and l_0_8 == 1593886720 and l_0_9 == 3842003712 and l_0_10 == 1593886720 and l_0_11 == 1627409664 then
  return mp.INFECTED
end
return mp.CLEAN
