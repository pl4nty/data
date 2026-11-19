-- Threat: !InfrastructureShared
-- Name: 3f8998b2994d
-- Type: 21

local l_0_0 = 256 - string.byte(pe.mmap_va(pevars.sigaddr + 2, 1))
local l_0_1 = 256 - string.byte(pe.mmap_va(pevars.sigaddr + 33, 1))
local l_0_2 = mp.readu_u32(pe.mmap_va(pe.get_regval(pe.REG_EBP) - l_0_0, 4), 1)
local l_0_3 = mp.readu_u32(pe.mmap_va(pe.get_regval(pe.REG_EBP) - l_0_1, 4), 1)
mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", mp.bitand(mp.shr32(l_0_2, 2), 255), mp.bitand(mp.shr32(l_0_3, 2), 255)))
return mp.INFECTED
