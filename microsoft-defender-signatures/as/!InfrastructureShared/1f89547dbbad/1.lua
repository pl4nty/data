-- Threat: !InfrastructureShared
-- Name: 1f89547dbbad
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 9, "\228\228")
local l_0_0 = 160
local l_0_1 = pe.mmap_va(pevars.sigaddr, l_0_0)
local l_0_2 = string.find(l_0_1, "P\232....=....u", 1, true)
pe.mmap_patch_va(pevars.sigaddr + l_0_2 + 10, "\235")
return mp.INFECTED
