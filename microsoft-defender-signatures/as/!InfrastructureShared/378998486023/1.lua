-- Threat: !InfrastructureShared
-- Name: 378998486023
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + string.find(pe.mmap_va(pevars.sigaddr, 64), "I\131\249", 1, true) + 3, "\144\144")
return mp.INFECTED
