-- Threat: !InfrastructureShared
-- Name: 55955da83735
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 64)
local l_0_1 = string.find(l_0_0, "a\129}", 1, true)
if l_0_1 ~= nil then
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 7, "\144\144")
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 16, "\144\144")
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 22, "\144\144")
  return mp.INFECTED
end
return mp.LOWFI
