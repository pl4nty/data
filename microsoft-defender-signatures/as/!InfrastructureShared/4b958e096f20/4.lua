-- Threat: !InfrastructureShared
-- Name: 4b958e096f20
-- Type: 21

local l_0_0 = 16
local l_0_1 = pe.mmap_va(pevars.sigaddr + l_0_0, 96)
local l_0_2 = string.byte(l_0_1, 1) + 2
if l_0_2 > #l_0_1 then
  return mp.CLEAN
end
if string.byte(l_0_1, l_0_2 - 2) == 117 and string.byte(l_0_1, l_0_2 - 4) == 116 then
  local l_0_3 = string.byte(l_0_1, l_0_2 - 3) + l_0_2 - 2
  if l_0_3 > #l_0_1 then
    return mp.CLEAN
  end
  if string.byte(l_0_1, l_0_3) == 232 then
    local l_0_4 = "\235"
    pe.mmap_patch_va(pevars.sigaddr + l_0_0 + l_0_2 - 5, l_0_4)
    return mp.INFECTED
  end
end
return mp.CLEAN
