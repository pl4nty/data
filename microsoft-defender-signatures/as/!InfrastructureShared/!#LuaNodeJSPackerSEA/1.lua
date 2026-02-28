local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L4_2 = pehdr
  L4_2 = L4_2.DataDirectory
  L5_2 = pe
  L5_2 = L5_2.IMAGE_DIRECTORY_ENTRY_RESOURCE
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2.RVA
  L5_2 = L4_2 + A0_2
  if L5_2 then
    L6_2 = pe
    L6_2 = L6_2.contains_rva
    L7_2 = A3_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = pe
      L6_2 = L6_2.contains_rva
      L7_2 = A3_2
      L8_2 = L5_2 + 16
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        goto lbl_26
      end
    end
  end
  L6_2 = nil
  do return L6_2 end
  ::lbl_26::
  L6_2 = pe
  L6_2 = L6_2.mmap_rva
  L7_2 = L5_2
  L8_2 = 16
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = mp
  L7_2 = L7_2.readu_u16
  L8_2 = L6_2
  L9_2 = 13
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = mp
  L8_2 = L8_2.readu_u16
  L9_2 = L6_2
  L10_2 = 15
  L8_2 = L8_2(L9_2, L10_2)
  L7_2 = L7_2 + L8_2
  if 10 <= L7_2 then
    L8_2 = nil
    return L8_2
  end
  L8_2 = L5_2 + 16
  L9_2 = pe
  L9_2 = L9_2.contains_rva
  L10_2 = A3_2
  L11_2 = L8_2
  L9_2 = L9_2(L10_2, L11_2)
  if L9_2 then
    L9_2 = pe
    L9_2 = L9_2.contains_rva
    L10_2 = A3_2
    L11_2 = L7_2 * 8
    L11_2 = L8_2 + L11_2
    L9_2 = L9_2(L10_2, L11_2)
    if L9_2 then
      goto lbl_64
    end
  end
  L9_2 = nil
  do return L9_2 end
  ::lbl_64::
  L9_2 = pe
  L9_2 = L9_2.mmap_rva
  L10_2 = L8_2
  L11_2 = L7_2 * 8
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = 1
  L11_2 = L7_2 * 8
  L12_2 = 8
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = mp
    L14_2 = L14_2.readu_u32
    L15_2 = L9_2
    L16_2 = L13_2
    L14_2 = L14_2(L15_2, L16_2)
    if A1_2 == 1 and L14_2 == A2_2 then
      L15_2 = mp
      L15_2 = L15_2.bitand
      L16_2 = mp
      L16_2 = L16_2.readu_u32
      L17_2 = L9_2
      L18_2 = L13_2 + 4
      L16_2 = L16_2(L17_2, L18_2)
      L17_2 = 2147483647
      return L15_2(L16_2, L17_2)
    elseif A1_2 == 2 then
      L15_2 = mp
      L15_2 = L15_2.bitand
      L16_2 = L14_2
      L17_2 = 2147483648
      L15_2 = L15_2(L16_2, L17_2)
      if L15_2 then
        L15_2 = mp
        L15_2 = L15_2.bitand
        L16_2 = L14_2
        L17_2 = 2147483647
        L15_2 = L15_2(L16_2, L17_2)
        L16_2 = L4_2 + L15_2
        L17_2 = pe
        L17_2 = L17_2.contains_rva
        L18_2 = A3_2
        L19_2 = L16_2
        L17_2 = L17_2(L18_2, L19_2)
        if L17_2 then
          L17_2 = pe
          L17_2 = L17_2.contains_rva
          L18_2 = A3_2
          L19_2 = L16_2 + 2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 then
            goto lbl_124
          end
        end
        L17_2 = false
        do return L17_2 end
        ::lbl_124::
        L17_2 = mp
        L17_2 = L17_2.readu_u16
        L18_2 = pe
        L18_2 = L18_2.mmap_rva
        L19_2 = L16_2
        L20_2 = 2
        L18_2 = L18_2(L19_2, L20_2)
        L19_2 = 1
        L17_2 = L17_2(L18_2, L19_2)
        L18_2 = #A2_2
        if L17_2 == L18_2 then
          L17_2 = pe
          L17_2 = L17_2.mmap_rva
          L18_2 = L16_2 + 2
          L19_2 = #A2_2
          L19_2 = L19_2 * 2
          L17_2 = L17_2(L18_2, L19_2)
          L18_2 = "\000\000"
          L17_2 = L17_2 .. L18_2
          L18_2 = mp
          L18_2 = L18_2.utf16to8
          L19_2 = L17_2
          L18_2 = L18_2(L19_2)
          if L18_2 == A2_2 then
            return L15_2
          end
        end
      end
    end
  end
  L10_2 = nil
  return L10_2
end

L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L2_1 = pe
L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
L1_1 = L1_1[L2_1]
L1_1 = L1_1.RVA
if L1_1 ~= 0 then
  L1_1 = pehdr
  L1_1 = L1_1.DataDirectory
  L2_1 = pe
  L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
  L1_1 = L1_1[L2_1]
  L1_1 = L1_1.RVA
  if L1_1 ~= nil then
    goto lbl_21
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_21::
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L1_1 < 10 then
  L1_1 = pehdr
  L1_1 = L1_1.NumberOfSections
  if L1_1 then
    goto lbl_30
  end
end
L1_1 = 10
::lbl_30::
L2_1 = -1
L3_1 = 1
L4_1 = L1_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = pe
  L7_1 = L7_1.contains_rva
  L8_1 = L6_1
  L9_1 = pehdr
  L9_1 = L9_1.DataDirectory
  L10_1 = pe
  L10_1 = L10_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
  L9_1 = L9_1[L10_1]
  L9_1 = L9_1.RVA
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L2_1 = L6_1
  end
end
if L2_1 == -1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L0_1
L4_1 = 0
L5_1 = 1
L6_1 = 10
L7_1 = L2_1
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L0_1
L5_1 = L3_1
L6_1 = 2
L7_1 = "NODE_SEA_BLOB"
L8_1 = L2_1
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
