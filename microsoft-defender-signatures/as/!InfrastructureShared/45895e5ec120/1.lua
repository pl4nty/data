-- Threat: !InfrastructureShared
-- Name: 45895e5ec120
-- Type: 21

local l_0_0 = mp.readu_u32(pe.mmap_va(pe.get_regval(pe.REG_EBP) - mp.bitand(0 - string.byte(pe.mmap_va(pevars.sigaddr + 2, 1)), 255), 4), 1)
if pe.get_api_id(l_0_0) == 3164325074 then
  pe.mmap_patch_va(pevars.sigaddr + string.find(pe.mmap_va(pevars.sigaddr, 64), "\208t", 1, true), "\235")
  return mp.INFECTED
end
return mp.CLEAN
