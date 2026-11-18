-- Threat: !InfrastructureShared
-- Name: 6589639a20ce
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\144\144\144\144\144\144")
pe.mmap_patch_va(pevars.sigaddr + 33, "\144\144")
return mp.INFECTED
