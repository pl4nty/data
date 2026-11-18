-- Threat: !InfrastructureShared
-- Name: 438974787a16
-- Type: 21

if mp.readu_u32(pe.mmap_va(pevars.sigaddr + 21, 4), 1) > 40960 then
  return mp.INFECTED
end
return mp.CLEAN
