-- Threat: !InfrastructureShared
-- Name: 1e89fe6b69cd
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 1, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if 65536 < l_0_1 then
  pe.mmap_patch_va(pevars.sigaddr + 17, "\000")
end
return mp.CLEAN
