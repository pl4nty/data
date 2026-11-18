-- Threat: !InfrastructureShared
-- Name: 4389c26ae2db
-- Type: 21

pe.mmap_patch_va(pe.get_regval(pe.REG_EIP) + 37, "\000\016\000\000")
return mp.INFECTED
