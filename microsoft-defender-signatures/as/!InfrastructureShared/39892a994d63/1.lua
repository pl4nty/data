-- Threat: !InfrastructureShared
-- Name: 39892a994d63
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 12, "\235")
return mp.INFECTED
