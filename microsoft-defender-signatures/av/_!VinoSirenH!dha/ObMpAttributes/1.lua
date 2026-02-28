local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
L1_1 = L1_1 + 1
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = pehdr
  L0_1 = L0_1.DataDirectory
  L1_1 = pe
  L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
  L1_1 = L1_1 + 1
  L0_1 = L0_1[L1_1]
  L0_1 = L0_1.Size
  if L0_1 ~= 0 then
    goto lbl_22
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_22::
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
L1_1 = L1_1 + 1
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L2_1 = pe
L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
L2_1 = L2_1 + 1
L1_1 = L1_1[L2_1]
L1_1 = L1_1.Size
L2_1 = pesecs
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L2_1 = L2_1[L3_1]
L2_1 = L2_1.PointerToRawData
L3_1 = pesecs
L4_1 = pehdr
L4_1 = L4_1.NumberOfSections
L3_1 = L3_1[L4_1]
L3_1 = L3_1.SizeOfRawData
L2_1 = L2_1 + L3_1
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L0_1 == L2_1 then
  L4_1 = L0_1 + L1_1
  if not (L3_1 < L4_1) then
    goto lbl_58
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_58::
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L2_1
L6_1 = 4
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L4_1
L7_1 = 1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 0 then
  L6_1 = L2_1 + L5_1
  if not (L3_1 < L6_1) then
    goto lbl_85
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_85::
L6_1 = L2_1 + 4
L6_1 = L6_1 + L5_1
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = L6_1
L9_1 = 20
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.readprotection
L9_1 = true
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.readu_u32
L9_1 = L7_1
L10_1 = 13
L8_1 = L8_1(L9_1, L10_1)
if L8_1 < 1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.readu_u32
L9_1 = L7_1
L10_1 = 17
L8_1 = L8_1(L9_1, L10_1)
L5_1 = L8_1
if L5_1 ~= 0 then
  L8_1 = L6_1 + 20
  L8_1 = L8_1 + 4
  L8_1 = L8_1 + L5_1
  if not (L3_1 < L8_1) then
    goto lbl_127
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_127::
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
