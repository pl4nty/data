-- Threat: !InfrastructureShared
-- Name: 7d8979dec4d1
-- Type: 21

local l_0_0 = pevars.sigaddr + 56
local l_0_1 = pe.vm_search(l_0_0, l_0_0 + 4040, "\161\144\001\004\139\016\137\021\144\001\004\255%\144\001\004j@h\000\016\000\000h\144\001\004j\000\232\218\255\255\255\144\000", nil, pe.VM_SEARCH_BM)
if l_0_1 == 4294967295 then
  return mp.CLEAN
end
l_0_1 = pe.vm_search(l_0_0, l_0_0 + 4040, "9\bu\144\001\001\184\144\001\004\255\a9\au\144\001\0011\210\131\192\001\185\144\001\004\137\001\161\144\001\004\141\176\144\001\004\139\029\144\001\004\129\235\144\001\004\144\004\001\002\235\233\144\000", nil, pe.VM_SEARCH_BM)
if l_0_1 == 4294967295 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_va(l_0_1 + 5, 4)
local l_0_3 = mp.readu_u32(l_0_2, 1)
pe.set_regval(pe.REG_EAX, l_0_3)
local l_0_4 = pevars.sigaddr + 6
local l_0_5 = l_0_1 + 32 - l_0_4 - 5
local l_0_6, l_0_7, l_0_8, l_0_9 = mp.bsplit(l_0_5, 8)
pe.mmap_patch_va(l_0_4, "\233")
pe.mmap_patch_va(l_0_4 + 1, string.char(l_0_6))
pe.mmap_patch_va(l_0_4 + 2, string.char(l_0_7))
pe.mmap_patch_va(l_0_4 + 3, string.char(l_0_8))
pe.mmap_patch_va(l_0_4 + 4, string.char(l_0_9))
return mp.INFECTED
