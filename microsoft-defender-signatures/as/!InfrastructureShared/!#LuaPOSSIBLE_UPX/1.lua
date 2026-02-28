local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = 2
L2_1 = elfhdr
L2_1 = L2_1.type
if L2_1 ~= 2 then
  L2_1 = elfhdr
  L2_1 = L2_1.type
  if L2_1 ~= 3 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = elfhdr
L2_1 = L2_1.phnum
if L2_1 ~= 3 then
  L2_1 = elfhdr
  L2_1 = L2_1.phnum
  if L2_1 ~= 2 then
    goto lbl_28
  end
end
L2_1 = elfhdr
L2_1 = L2_1.shnum
::lbl_28::
if L2_1 ~= 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = elfhdr
L2_1 = L2_1.ident
L3_1 = string
L3_1 = L3_1.byte
L4_1 = L2_1
L5_1 = 6
L3_1 = L3_1(L4_1, L5_1)
L4_1 = elfhdr
L4_1 = L4_1.phoff
L5_1 = elfhdr
L5_1 = L5_1.ehsize
if L4_1 ~= L5_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = elfhdr
L4_1 = L4_1.phoff
L5_1 = elfhdr
L5_1 = L5_1.phnum
L6_1 = elfhdr
L6_1 = L6_1.phentsize
L5_1 = L5_1 * L6_1
L4_1 = L4_1 + L5_1
L4_1 = L4_1 + 4
L4_1 = L4_1 + 1
L5_1 = mp
L5_1 = L5_1.HEADERPAGE_SZ
L5_1 = L5_1 - 3
if L4_1 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = headerpage
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == 0 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.FOOTERPAGE_SZ
  L6_1 = L6_1 - 32
  L6_1 = L6_1 - 4
  L6_1 = L6_1 + 1
  L7_1 = mp
  L7_1 = L7_1.readu_u32
  L8_1 = footerpage
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = L7_1 == L5_1
  L9_1 = nil
  if not L8_1 then
    L10_1 = 80
    L11_1 = L6_1 - L10_1
    repeat
      L6_1 = L6_1 - 1
      L12_1 = mp
      L12_1 = L12_1.readu_u32
      L13_1 = footerpage
      L14_1 = L6_1
      L12_1 = L12_1(L13_1, L14_1)
      L9_1 = L12_1
      L8_1 = L9_1 == L5_1
    until L8_1 or L11_1 >= L6_1
  end
  if not L8_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = L6_1 + 32
  L11_1 = mp
  L11_1 = L11_1.readu_u32
  L12_1 = footerpage
  L13_1 = L10_1
  L11_1 = L11_1(L12_1, L13_1)
  if L3_1 == L1_1 then
    L12_1 = L11_1 % 256
    L13_1 = L11_1 - L12_1
    L11_1 = L13_1 / 256
    L13_1 = L11_1 % 256
    L14_1 = L11_1 - L13_1
    L11_1 = L14_1 / 256
    L14_1 = L11_1 % 256
    L15_1 = L11_1 - L14_1
    L11_1 = L15_1 / 256
    L15_1 = L11_1
    L16_1 = L12_1 * 16777216
    L17_1 = L13_1 * 65536
    L16_1 = L16_1 + L17_1
    L17_1 = L14_1 * 256
    L16_1 = L16_1 + L17_1
    L11_1 = L16_1 + L15_1
  end
  if not (L0_1 < L11_1) then
    L12_1 = elfhdr
    L12_1 = L12_1.phoff
    L13_1 = elfhdr
    L13_1 = L13_1.phnum
    L14_1 = elfhdr
    L14_1 = L14_1.phentsize
    L13_1 = L13_1 * L14_1
    L12_1 = L12_1 + L13_1
    L12_1 = L12_1 + 12
    if L11_1 == L12_1 then
      goto lbl_151
    end
  end
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  do return L12_1 end
  ::lbl_151::
  L12_1 = false
  L13_1 = L6_1 - 16
  L14_1 = nil
  while L6_1 > L13_1 and not L12_1 do
    L15_1 = mp
    L15_1 = L15_1.readu_u32
    L16_1 = footerpage
    L17_1 = L13_1
    L15_1 = L15_1(L16_1, L17_1)
    L14_1 = L15_1
    L12_1 = L14_1 == L5_1
    L13_1 = L13_1 + 1
  end
  if L12_1 then
    L15_1 = mp
    L15_1 = L15_1.set_mpattributeex
    L16_1 = "Lua:POSSIBLE_UPX_MAGIC"
    L17_1 = L5_1
    L15_1(L16_1, L17_1)
    L15_1 = mp
    L15_1 = L15_1.INFECTED
    return L15_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
