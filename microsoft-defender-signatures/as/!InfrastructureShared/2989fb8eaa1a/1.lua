-- Threat: !InfrastructureShared
-- Name: 2989fb8eaa1a
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EBP)
local l_0_1 = pe.mmap_va(pevars.sigaddr, 8)
local l_0_2 = mp.bitor(string.byte(l_0_1, 3), 4294967040)
l_0_1 = pe.mmap_va(mp.bitand(l_0_0 + l_0_2, 4294967295), 4)
local l_0_3 = mp.readu_u32(l_0_1, 1) + 1
l_0_1 = pe.mmap_va(l_0_3, 4)
local l_0_4 = mp.readu_u32(l_0_1, 1)
if l_0_4 == 707406378 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
