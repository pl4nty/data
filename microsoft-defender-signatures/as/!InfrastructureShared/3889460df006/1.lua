-- Threat: !InfrastructureShared
-- Name: 3889460df006
-- Type: 21

local l_0_0 = pevars.sigaddr + 32
local l_0_1 = string.find(pe.mmap_va(l_0_0, 64), "t\017", 1, true)
if l_0_1 == nil then
  l_0_1 = string.find(pe.mmap_va(l_0_0, 32), "t\003", 1, true)
  if l_0_1 == nil then
    l_0_1 = string.find(pe.mmap_va(l_0_0, 64), "t\018", 1, true)
    if l_0_1 == nil then
      l_0_1 = string.find(pe.mmap_va(l_0_0, 64), "t\002", 1, true)
    end
  end
end
pe.mmap_patch_va(l_0_0 + l_0_1 - 1, "\235")
return mp.INFECTED
