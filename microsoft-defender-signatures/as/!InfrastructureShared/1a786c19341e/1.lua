-- Threat: !InfrastructureShared
-- Name: 1a786c19341e
-- Type: 21

local l_0_0 = pehdr.AddressOfEntryPoint + pehdr.ImageBase
local l_0_1, l_0_2
if hstrlog[1].matched then
  l_0_1 = 14
  l_0_2 = hstrlog[1].VA
end
local l_0_3 = pe.mmap_va(l_0_2, 21)
local l_0_4 = mp.readu_u32(l_0_3, l_0_1)
local l_0_5 = l_0_2 + l_0_1 + 3 + l_0_4
l_0_5 = mp.bitand(l_0_5, 4294967295)
if l_0_5 == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
