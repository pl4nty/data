-- Threat: !InfrastructureShared
-- Name: 3f89aa21fa32
-- Type: 21

if mp.readu_u32(pe.mmap_va(pevars.sigaddr - 4, 4), 1) < 65536 then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + 30, "\144\144")
return mp.INFECTED
