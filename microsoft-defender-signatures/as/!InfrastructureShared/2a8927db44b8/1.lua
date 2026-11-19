-- Threat: !InfrastructureShared
-- Name: 2a8927db44b8
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 11, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
l_0_0 = pe.mmap_va(l_0_1, 4)
l_0_1 = mp.readu_u32(l_0_0, 1)
local l_0_2 = pe.get_api_id(l_0_1)
if l_0_2 == 3267971814 then
  pe.mmap_patch_va(pevars.sigaddr + 7, "\235")
  return mp.INFECTED
end
return mp.CLEAN
