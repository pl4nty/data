-- Threat: !InfrastructureShared
-- Name: c078f0dd8bf7
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, mp.getfilesize() < 4096 and mp.getfilesize() or 4096)
local l_0_2 = 4096 > 60 and mp.readu_u32(l_0_1, 61) or 8192
local l_0_3 = 4096 > l_0_2 + 11 and mp.readu_u16(l_0_1, l_0_2 + 11 + 1) or 8192
if mp.getfilesize() < 1400000 and mp.getfilesize() > 800000 and l_0_0 == 6 and hstrlog[7].VA == 64 + pehdr.ImageBase and l_0_3 == 89 and hstrlog[8].VA >= 600 + pehdr.ImageBase and hstrlog[8].VA <= 700 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN
