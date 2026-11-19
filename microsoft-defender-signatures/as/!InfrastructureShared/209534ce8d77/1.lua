-- Threat: !InfrastructureShared
-- Name: 209534ce8d77
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 21, 35)
if l_0_0 ~= nil then
  local l_0_1 = string.find(l_0_0, "u", 1, true)
  if l_0_1 ~= nil then
    pe.mmap_patch_va(pevars.sigaddr + 21 + l_0_1 - 1, "\144\144")
  end
end
return mp.INFECTED
