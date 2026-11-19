-- Threat: !InfrastructureShared
-- Name: 599596dbca98
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 32), "\232\000\000\000\000", 1, true) + 5 - 1
local l_0_1 = pe.mmap_va(pevars.sigaddr + l_0_0, 16)
local l_0_2 = string.find(l_0_1, "\128,", 1, true)
if l_0_2 == nil then
  l_0_2 = string.find(l_0_1, "\128\004", 1, true)
end
for l_0_3 = 1, l_0_2 - 1 do
  pe.mmap_patch_va(pevars.sigaddr + l_0_0 + l_0_3 - 1, "\144")
end
return mp.INFECTED
