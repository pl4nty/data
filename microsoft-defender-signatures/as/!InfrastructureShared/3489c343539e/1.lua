-- Threat: !InfrastructureShared
-- Name: 3489c343539e
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 6, 1)
pe.set_regval(pe.REG_EAX, string.byte(l_0_0, 1))
pe.mmap_patch_va(pevars.sigaddr, "\144\144\144\144\144")
return mp.INFECTED
