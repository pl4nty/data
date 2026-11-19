-- Threat: !InfrastructureShared
-- Name: 4d897d7c1eb3
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 9, 1)
pe.set_regval(pe.REG_EAX, string.byte(l_0_0, 1))
pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144")
return mp.INFECTED
