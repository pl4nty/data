-- Threat: !InfrastructureShared
-- Name: 9c89bd1faae2
-- Type: 21

local l_0_0 = pevars.sigaddr + 56
local l_0_1 = pe.vm_search(l_0_0, l_0_0 + 4040, "j@h\000\016\000\000h\144\001\004j\000\144\019\161\144\001\004\139\016\137\021\144\001\004\255%\144\000", nil, pe.VM_SEARCH_BM)
if l_0_1 == 4294967295 then
  return mp.CLEAN
end
pe.set_peattribute("hstr_exhaustive", true)
local l_0_2 = 9
local l_0_3 = pe.vm_search(l_0_0, l_0_0 + 4040, "\141\176\144\001\004\139\029\144\001\004\129\235\144\001\004\144\003\003\000\144\001\t\144\004\001\002\235\233\144\000", nil, pe.VM_SEARCH_BM)
if l_0_3 == 4294967295 then
  return mp.CLEAN
end
local l_0_4 = pe.vm_search(l_0_3 - 46, l_0_3, "1\210\131\192\001\185\144\001\004\137\001\161\144\000", nil, pe.VM_SEARCH_BM)
if l_0_4 == 4294967295 then
  return mp.CLEAN
end
local l_0_5 = pe.vm_search(l_0_4 - 68, l_0_4, "9\b\015\133\144\001\004\184\144\001\004\255\a9\a\015\133\144\000", nil, pe.VM_SEARCH_BM)
if l_0_5 == 4294967295 then
  l_0_2 = 5
  l_0_5 = pe.vm_search(l_0_4 - 60, l_0_4, "9\bu\144\001\001\184\144\001\004\255\a9\au\144\000", nil, pe.VM_SEARCH_BM)
  if l_0_5 == 4294967295 then
    return mp.CLEAN
  end
end
local l_0_6 = pe.mmap_va(l_0_3 + 17, 9)
if mp.readu_u16(l_0_6, 1) == 15747 and string.byte(l_0_6, 8) == 124 then
  pe.mmap_patch_va(l_0_3 + 25, "\000")
end
local l_0_7 = pe.mmap_va(l_0_5 + l_0_2, 4)
local l_0_8 = mp.readu_u32(l_0_7, 1)
pe.set_regval(pe.REG_EAX, l_0_8)
local l_0_9 = pevars.sigaddr + 6
local l_0_10 = l_0_3 - l_0_9 - 5
local l_0_11, l_0_12, l_0_13, l_0_14 = mp.bsplit(l_0_10, 8)
pe.mmap_patch_va(l_0_9, "\233")
pe.mmap_patch_va(l_0_9 + 1, string.char(l_0_11))
pe.mmap_patch_va(l_0_9 + 2, string.char(l_0_12))
pe.mmap_patch_va(l_0_9 + 3, string.char(l_0_13))
pe.mmap_patch_va(l_0_9 + 4, string.char(l_0_14))
local l_0_15 = pe.mmap_va(l_0_1 + 27, 16)
if mp.readu_u16(l_0_15, 1) == 15747 and mp.readu_u16(l_0_15, 8) == 35855 then
  pe.mmap_patch_va(l_0_1 + 34, "\000\000\000\000")
end
local l_0_16 = {
  "\139\021\144\001\004\131\250\144\001\001\144\003\002\001\015\140|\144\000",
  "P\161\144\001\004@\131\248\144\001\001X\144\003\002\001\015\140|\144\000",
  "V\1395\144\001\004\141F\001\131\248\144\001\001^X\144\003\002\001\015\140|\144\000",
  "PV\161\144\001\004\137\198@\141F\001\131\248\144\001\001^X\144\003\002\001\015\140|\144\000",
  "PV\161\144\001\004\137\198@\141F\002;\005\144\001\004^X\144\003\002\001\015\140|\144\000"
}
local l_0_17 = {
  0,
  1,
  1,
  1,
  2
}
local l_0_18 = {
  7,
  8,
  10,
  13,
  141
}
local l_0_19 = {
  2,
  2,
  3,
  3,
  3
}
local l_0_20 = 0
local l_0_21 = 0
local l_0_22 = 1
while l_0_22 <= #l_0_16 do
  local l_0_23 = pe.vm_search(l_0_5, l_0_3, l_0_16[l_0_22], nil, pe.VM_SEARCH_BM)
  if l_0_23 ~= 4294967295 then
    if l_0_18[l_0_22] < 128 then
      l_0_20 = pe.mmap_va(l_0_23 + l_0_19[l_0_22], l_0_18[l_0_22])
      l_0_21 = string.byte(l_0_20, l_0_18[l_0_22]) - l_0_17[l_0_22]
    else
      local l_0_24 = l_0_18[l_0_22] - 128
      l_0_20 = pe.mmap_va(l_0_23 + l_0_19[l_0_22], l_0_24 + 3)
      local l_0_25 = mp.readu_u32(l_0_20, l_0_24)
      if pe.foffset_va(l_0_25) == 4294967295 then
        return mp.INFECTED
      end
      local l_0_26 = pe.mmap_va(l_0_25, 4)
      l_0_21 = mp.readu_u32(l_0_26, 1)
    end
    local l_0_27 = mp.readu_u32(l_0_20, 1)
    if pe.foffset_va(l_0_27) == 4294967295 then
      return mp.INFECTED
    end
    l_0_11, l_0_12, l_0_13, l_0_14 = mp.bsplit(l_0_21, 8)
    pe.mmap_patch_va(l_0_27, string.char(l_0_11))
    pe.mmap_patch_va(l_0_27 + 1, string.char(l_0_12))
    pe.mmap_patch_va(l_0_27 + 2, string.char(l_0_13))
    pe.mmap_patch_va(l_0_27 + 3, string.char(l_0_14))
    return mp.INFECTED
  end
  l_0_22 = l_0_22 + 1
end
return mp.INFECTED
