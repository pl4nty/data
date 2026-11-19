-- Threat: !InfrastructureShared
-- Name: 3b89ba0d3dcd
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 13, 4)
local l_0_1 = string.find(l_0_0, "\173\139\240", 1, true)
local l_0_2 = 44
if l_0_1 ~= nil then
  l_0_2 = l_0_2 + 1
else
  l_0_1 = string.find(l_0_0, "\1396", 1, true)
  if l_0_1 ~= nil then
    l_0_2 = l_0_2 + 2
  else
    return mp.LOWFI
  end
end
pe.mmap_patch_va(pevars.sigaddr + l_0_2, ")\246\235 ")
return mp.CLEAN
