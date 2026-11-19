-- Threat: !InfrastructureShared
-- Name: 3f95ffa14611
-- Type: 21

local l_0_0 = 144
local l_0_1 = pe.mmap_va(pevars.sigaddr, l_0_0)
local l_0_2 = 66
local l_0_3 = 0
while string.byte(l_0_1, l_0_2) == 104 do
  l_0_2 = l_0_2 + 5
  l_0_3 = l_0_3 + 1
  if l_0_0 < l_0_2 then
    return mp.CLEAN
  end
  if 20 <= l_0_3 then
    return mp.CLEAN
  end
end
if mp.readu_u32(l_0_1, l_0_2) == 1146486612 and mp.readu_u32(l_0_1, l_0_2 + 4) == 3296978315 and mp.readu_u16(l_0_1, l_0_2 + 8) == 24912 and string.byte(l_0_1, l_0_2 + 10) == 233 then
  return mp.INFECTED
end
return mp.CLEAN
