-- Threat: !InfrastructureShared
-- Name: 50951d77988d
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 64)
local l_0_1 = string.find(l_0_0, "\137U\248", 1, true)
if l_0_1 ~= nil then
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 9, "\144\144")
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 18, "\144\144")
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 24, "\144\144")
  return mp.INFECTED
end
return mp.LOWFI
