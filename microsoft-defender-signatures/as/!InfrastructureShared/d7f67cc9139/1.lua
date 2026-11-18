-- Threat: !InfrastructureShared
-- Name: d7f67cc9139
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = mp.readu_u16(l_0_0, 1)
if l_0_1 ~= 32129 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u16(l_0_0, 8)
if l_0_2 ~= 5245 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(l_0_0, 4)
if l_0_3 < 16777216 then
  return mp.CLEAN
end
local l_0_4 = string.byte(l_0_0, 3)
local l_0_5 = string.byte(l_0_0, 12)
local l_0_6 = string.byte(l_0_0, 15)
if 2 < l_0_6 then
  return mp.CLEAN
end
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.byte(l_0_0, 18)
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.byte(l_0_0, 21)
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.byte(l_0_0, 27)
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr, "\199E")
return mp.INFECTED
