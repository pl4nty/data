-- Threat: !InfrastructureShared
-- Name: 5995a0a526bf
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 13, 96)
local l_0_1 = 1
while l_0_1 < #l_0_0 do
  local l_0_2 = string.byte(l_0_0, l_0_1)
  if l_0_2 == 232 then
    if mp.readu_u32(l_0_0, l_0_1 + 1) ~= 0 then
      return mp.CLEAN
    end
    l_0_1 = l_0_1 + 5
  elseif l_0_2 == 61 then
    do
      local l_0_3 = "\235"
      pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 34, l_0_3)
      return mp.INFECTED
    end
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
