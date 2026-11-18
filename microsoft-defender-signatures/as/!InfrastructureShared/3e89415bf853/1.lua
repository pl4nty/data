-- Threat: !InfrastructureShared
-- Name: 3e89415bf853
-- Type: 21

local l_0_0 = 6
local l_0_1 = string.find(pe.mmap_va(pevars.sigaddr, 16), "\015\132", 1, true)
if not l_0_1 then
  l_0_1 = string.find(pe.mmap_va(pevars.sigaddr, 16), "t", 1, true)
  l_0_0 = 2
end
if not l_0_1 then
  return mp.CLEAN
end
if l_0_0 == 6 then
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 - 1, "\144\144\144\144\144\144")
else
  pe.mmap_patch_va(pevars.sigaddr + l_0_1 - 1, "\144\144")
end
return mp.INFECTED
