-- Threat: !InfrastructureShared
-- Name: 3d89c327516f
-- Type: 21

local l_0_0 = 20
local l_0_1 = pe.mmap_va(pevars.sigaddr + l_0_0, 256)
local l_0_2 = string.find(l_0_1, "t", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0 + l_0_2 - 1
pe.mmap_patch_va(pevars.sigaddr + l_0_0, "\235")
l_0_1 = pe.mmap_va(pevars.sigaddr, l_0_0)
for l_0_3 = 1, l_0_0 do
  local l_0_4 = string.find(l_0_1, "`\185....\243\164a", l_0_3, true)
  if not l_0_4 then
    break
  end
  pe.mmap_patch_va(pevars.sigaddr + l_0_4 - 1, "\144\144\144\144\144\144\144\144\144")
end
return mp.INFECTED
