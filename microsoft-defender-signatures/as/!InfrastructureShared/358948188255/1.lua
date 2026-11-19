-- Threat: !InfrastructureShared
-- Name: 358948188255
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 128), "I\129\249", 1, true)
local l_0_1 = 7
if l_0_0 == nil then
  l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 128), "I\131\249", 1, true)
  l_0_1 = 4
end
l_0_0 = l_0_0 - 1
pe.mmap_patch_va(pevars.sigaddr + l_0_0 + l_0_1, "\144\144")
return mp.INFECTED
