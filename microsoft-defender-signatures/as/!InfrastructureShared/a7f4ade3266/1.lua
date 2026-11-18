-- Threat: !InfrastructureShared
-- Name: a7f4ade3266
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = mp.readu_u32(l_0_0, 4)
local l_0_2 = 0
if l_0_1 ~= 2332783616 then
  l_0_1 = mp.readu_u32(l_0_0, 7)
  if l_0_1 ~= 2333176832 then
    return mp.CLEAN
  else
    l_0_2 = 3
  end
end
local l_0_3, l_0_4
if l_0_2 == 0 then
  l_0_3 = string.byte(l_0_0, 10)
  l_0_4 = string.byte(l_0_0, 12)
else
  l_0_3 = string.byte(l_0_0, 16)
  l_0_4 = string.byte(l_0_0, 18)
end
if l_0_4 ~= 1 then
  return mp.CLEAN
end
if l_0_3 ~= 131 then
  return mp.CLEAN
end
local l_0_5, l_0_6
if l_0_2 == 0 then
  l_0_5 = string.byte(l_0_0, 3)
  l_0_6 = string.byte(l_0_0, 9)
else
  l_0_5 = mp.readu_u32(l_0_0, 3)
  l_0_6 = mp.readu_u32(l_0_0, 9 + l_0_2)
end
if l_0_5 ~= l_0_6 then
  return mp.CLEAN
end
local l_0_7, l_0_8
if l_0_2 == 0 then
  l_0_7 = string.byte(l_0_0, 8)
  l_0_8 = string.byte(l_0_0, 14)
else
  l_0_7 = mp.readu_u32(l_0_0, 8 + l_0_2)
  l_0_8 = mp.readu_u32(l_0_0, 20)
end
if l_0_7 ~= l_0_8 then
  return mp.CLEAN
end
if l_0_2 == 0 then
  pe.mmap_patch_va(pevars.sigaddr, "\199E")
  pe.mmap_patch_va(pevars.sigaddr + 7 + l_0_2, "\235\b")
else
  pe.mmap_patch_va(pevars.sigaddr, "\199\133")
  pe.mmap_patch_va(pevars.sigaddr + 7 + l_0_2, "\235\014")
end
pe.mmap_patch_va(pevars.sigaddr + 4 + l_0_2, "\000\000\000")
return mp.CLEAN
