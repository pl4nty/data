local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = 500
L2_1 = 7
L3_1 = 62
L4_1 = 3
L5_1 = 1
L6_1 = 1
L7_1 = elfhdr
L7_1 = L7_1.ident
L8_1 = string
L8_1 = L8_1.byte
L9_1 = L7_1
L10_1 = 6
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == L6_1 then
  L9_1 = elfhdr
  L9_1 = L9_1.machine
  if L9_1 == L3_1 then
    goto lbl_30
  end
  L9_1 = elfhdr
  L9_1 = L9_1.machine
  if L9_1 == L4_1 then
    goto lbl_30
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_30::
if L0_1 > L1_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = elfhdr
L9_1 = L9_1.phnum
if L9_1 ~= 1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = ephdrs
L9_1 = L9_1[1]
L10_1 = L9_1.type
if L10_1 == L5_1 then
  L10_1 = L9_1.offset
  if L10_1 == 0 then
    L10_1 = L9_1.flags
    if L10_1 == L2_1 then
      L10_1 = L9_1.align
      if L10_1 == 4096 then
        goto lbl_59
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_59::
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
