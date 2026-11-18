-- Threat: !InfrastructureShared
-- Name: 2a95eb0d1e65
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 17, 1)
local l_0_1 = 21
if string.byte(l_0_0) == 129 then
  l_0_1 = 24
  if string.byte(pe.mmap_va(pevars.sigaddr + 21, 1)) == 2 then
    return mp.CLEAN
  end
end
pe.mmap_patch_va(pevars.sigaddr + l_0_1, "\235")
return mp.INFECTED
