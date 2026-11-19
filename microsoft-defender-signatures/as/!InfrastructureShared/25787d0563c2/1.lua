-- Threat: !InfrastructureShared
-- Name: 25787d0563c2
-- Type: 21
-- Flags: 1

mp.readprotection(false)
local l_0_0 = mp.readfile(0, mp.getfilesize() < 4096 and mp.getfilesize() or 4096)
local l_0_1 = 4096 > hstrlog[1].VA + 256 and mp.readu_u32(l_0_0, hstrlog[1].VA + 256 + 1) or 8192
local l_0_2 = 4096 > hstrlog[1].VA + 273 and mp.readu_u32(l_0_0, hstrlog[1].VA + 273 + 1) or 8192
local l_0_3 = 4096 > hstrlog[1].VA + 301 and mp.readu_u32(l_0_0, hstrlog[1].VA + 301 + 1) or 8192
local l_0_4 = 4096 > hstrlog[1].VA + 322 and mp.readu_u32(l_0_0, hstrlog[1].VA + 322 + 1) or 8192
local l_0_5 = 4096 > hstrlog[1].VA + 336 and mp.readu_u32(l_0_0, hstrlog[1].VA + 336 + 1) or 8192
local l_0_6 = 4096 > hstrlog[1].VA + 353 and mp.readu_u32(l_0_0, hstrlog[1].VA + 353 + 1) or 8192
local l_0_7 = 4096 > hstrlog[1].VA + 367 and mp.readu_u32(l_0_0, hstrlog[1].VA + 367 + 1) or 8192
local l_0_8 = 4096 > hstrlog[1].VA + 408 and mp.readu_u32(l_0_0, hstrlog[1].VA + 408 + 1) or 8192
local l_0_9 = 4096 > hstrlog[1].VA + 440 and mp.readu_u32(l_0_0, hstrlog[1].VA + 440 + 1) or 8192
local l_0_10 = 4096 > hstrlog[1].VA + 466 and mp.readu_u32(l_0_0, hstrlog[1].VA + 466 + 1) or 8192
local l_0_11 = 4096 > hstrlog[1].VA + 494 and mp.readu_u32(l_0_0, hstrlog[1].VA + 494 + 1) or 8192
if l_0_1 == 119961420 and l_0_2 == 7045161 and l_0_3 == 3772714986 and l_0_4 == 1731713986 and l_0_5 == 4281919927 and l_0_6 == 3778800756 and l_0_7 == 1632464501 and l_0_8 == 1606998274 and l_0_9 == 3847464024 and l_0_10 == 1606998274 and l_0_11 == 1632464501 then
  return mp.INFECTED
end
return mp.CLEAN
