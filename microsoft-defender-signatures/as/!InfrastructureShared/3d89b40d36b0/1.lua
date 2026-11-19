-- Threat: !InfrastructureShared
-- Name: 3d89b40d36b0
-- Type: 21

local l_0_0 = mp.readu_u32(pe.mmap_va(mp.readu_u32(pe.mmap_va(pevars.sigaddr + 3, 4), 1), 4), 1)
local l_0_1 = pe.get_api_id(l_0_0)
if l_0_1 ~= 3267971814 then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + 34, "\144\144")
return mp.INFECTED
