-- Threat: !InfrastructureShared
-- Name: b489192b673f
-- Type: 21

local l_0_0 = pevars.sigaddr + 56
local l_0_1 = pe.vm_search(l_0_0, l_0_0 + 4040, "j@h\000\016\000\000h\144\001\004j\000\144\019\161\144\001\004\139\016\137\021\144\001\004\255%\144\000", nil, pe.VM_SEARCH_BM)
if l_0_1 == 4294967295 then
  return mp.CLEAN
end
local l_0_2 = 9
local l_0_3 = pe.vm_search(l_0_0, l_0_0 + 4040, "1\210\131\192\001\185\144\001\004\137\001\161\144\001\004\141\176\144\001\004\139\029\144\001\004\129\235\144\001\004\144\003\003\000\144\001\t\144\004\001\002\235\233\144\000", nil, pe.VM_SEARCH_BM)
if l_0_3 == 4294967295 then
  return mp.CLEAN
end
local l_0_4 = pe.vm_search(l_0_3 - 36, l_0_3, "9\b\015\133\144\001\004\184\144\001\004\255\a9\a\015\133\144\000", nil, pe.VM_SEARCH_BM)
if l_0_4 == 4294967295 then
  l_0_4 = pe.vm_search(l_0_3 - 28, l_0_3, "9\bu\144\001\001\184\144\001\004\255\a9\au\144\000", nil, pe.VM_SEARCH_BM)
  if l_0_4 == 4294967295 then
    return mp.CLEAN
  end
end
local l_0_5 = pe.mmap_va(l_0_3 + 35, 9)
if mp.readu_u16(l_0_5, 1) == 15747 and string.byte(l_0_5, 8) == 124 then
  pe.mmap_patch_va(l_0_3 + 43, "\000")
end
local l_0_6 = pe.mmap_va(l_0_4 + l_0_2, 4)
local l_0_7 = mp.readu_u32(l_0_6, 1)
pe.set_regval(pe.REG_EAX, l_0_7)
local l_0_8 = pevars.sigaddr + 6
local l_0_9 = l_0_3 + 17 - l_0_8 - 5
local l_0_10, l_0_11, l_0_12, l_0_13 = mp.bsplit(l_0_9, 8)
pe.mmap_patch_va(l_0_8, "\233")
pe.mmap_patch_va(l_0_8 + 1, string.char(l_0_10))
pe.mmap_patch_va(l_0_8 + 2, string.char(l_0_11))
pe.mmap_patch_va(l_0_8 + 3, string.char(l_0_12))
pe.mmap_patch_va(l_0_8 + 4, string.char(l_0_13))
local l_0_14 = pe.mmap_va(l_0_1 + 27, 16)
if mp.readu_u16(l_0_14, 1) == 15747 and mp.readu_u16(l_0_14, 8) == 35855 then
  pe.mmap_patch_va(l_0_1 + 34, "\000\000\000\000")
end
return mp.INFECTED
