-- Threat: !InfrastructureShared
-- Name: 2a89c3c157f5
-- Type: 21

pe.mmap_patch_va(pe.get_regval(pe.REG_EIP) + 21, "\000\001\000\000")
return mp.INFECTED
