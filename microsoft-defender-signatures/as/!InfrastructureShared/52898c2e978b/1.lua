-- Threat: !InfrastructureShared
-- Name: 52898c2e978b
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 128), "Q\139\207", 1, true)
pe.mmap_patch_va(pevars.sigaddr, "\235" .. string.char(l_0_0 - 3))
return mp.INFECTED
