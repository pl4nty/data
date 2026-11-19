-- Threat: !InfrastructureShared
-- Name: 2d89138292f8
-- Type: 21

pe.set_regval(pe.REG_EAX, 11)
pe.set_regval(pe.REG_EBX, 1970169159)
pe.mmap_patch_va(pevars.sigaddr + 1, "\144\144\144\144")
return mp.INFECTED
