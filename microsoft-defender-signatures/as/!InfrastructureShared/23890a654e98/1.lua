-- Threat: !InfrastructureShared
-- Name: 23890a654e98
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 48)
local l_0_1 = string.find(l_0_0, "u\002", 1, true)
if l_0_1 ~= nil then
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 - 1, "\235")
  l_0_1 = string.find(l_0_0, "\184\001\000\000\000\015\162", 1, true)
  if l_0_1 ~= nil then
    pe.mmap_patch_va(pevars.sigaddr + l_0_1, "\002")
  end
  return mp.INFECTED
end
return mp.CLEAN
