-- Threat: !InfrastructureShared
-- Name: 1e898d85da12
-- Type: 21

local l_0_0 = 256 - string.byte(pe.mmap_va(pevars.sigaddr + 8, 1))
if mp.readu_u32(pe.mmap_va(pe.get_regval(pe.REG_EBP) - l_0_0, 4), 1) ~= 139 then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + 9, "\235")
return mp.INFECTED
