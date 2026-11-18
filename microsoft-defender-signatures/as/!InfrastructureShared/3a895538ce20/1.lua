-- Threat: !InfrastructureShared
-- Name: 3a895538ce20
-- Type: 21

local l_0_0 = 0
local l_0_1 = string.byte(pe.mmap_va(pevars.sigaddr + 14, 1), 1)
if l_0_1 == 129 then
  l_0_0 = 20
elseif l_0_1 == 131 then
  l_0_0 = 17
else
  l_0_0 = 24
end
local l_0_2 = pe.mmap_va(pevars.sigaddr + l_0_0, 64)
local l_0_3 = string.find(l_0_2, "t", 1, true)
if l_0_3 == nil then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + l_0_0 + l_0_3 - 1, "\235")
if string.byte(pe.mmap_va(pevars.sigaddr + 9, 1), 1) == 185 then
  for l_0_4 = 15, l_0_0 + l_0_3 - 1 do
    pe.mmap_patch_va(pevars.sigaddr + l_0_4 - 1, "\144")
  end
elseif string.byte(pe.mmap_va(pevars.sigaddr + 9, 1), 1) == 96 then
  for l_0_5 = string.find(pe.mmap_va(pevars.sigaddr, 32), "a\185", 1, true) + 1, l_0_0 + l_0_3 - 1 do
    pe.mmap_patch_va(pevars.sigaddr + l_0_5 - 1, "\144")
  end
  for l_0_6 = 10, string.find(pe.mmap_va(pevars.sigaddr + 9, 32), "a", 1, true) + 9 do
    pe.mmap_patch_va(pevars.sigaddr + l_0_6 - 1, "\144")
  end
else
  for l_0_7 = string.find(pe.mmap_va(pevars.sigaddr, 32), "\185", 1, true), l_0_0 + l_0_3 - 1 do
    pe.mmap_patch_va(pevars.sigaddr + l_0_7 - 1, "\144")
  end
end
return mp.INFECTED
