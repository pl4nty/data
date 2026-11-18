-- Threat: !InfrastructureShared
-- Name: 398971ecd73f
-- Type: 21

local l_0_0 = mp.readu_u32(pe.mmap_va(mp.readu_u32(pe.mmap_va(pevars.sigaddr + 2, 4), 1), 4), 1)
if pe.get_api_id(l_0_0) == 3164325074 then
  pe.mmap_patch_va(pevars.sigaddr + string.find(pe.mmap_va(pevars.sigaddr + 12, 16), "t", 1, true) + 11, "\235")
  return mp.INFECTED
end
return mp.CLEAN
