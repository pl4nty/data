-- Threat: !InfrastructureShared
-- Name: 1295a46174e1
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 21, 100)
if l_0_0 ~= nil then
  local l_0_1 = string.find(l_0_0, "\129;\026\164\006\000u", 1, true)
  if l_0_1 ~= nil then
    pe.mmap_patch_va(pevars.sigaddr + 21 + l_0_1 + 5, "\144\144")
  end
end
return mp.INFECTED
