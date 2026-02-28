local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if L0_1 ~= true then
    goto lbl_60
  end
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L2_1 = pe
L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L1_1 = L1_1[L2_1]
L1_1 = L1_1.RVA
L2_1 = pehdr
L2_1 = L2_1.DataDirectory
L3_1 = pe
L3_1 = L3_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L2_1 = L2_1[L3_1]
L2_1 = L2_1.Size
if L1_1 ~= 0 and not (L2_1 < 3654) and not (L0_1 <= L1_1) then
  L3_1 = L0_1 - L1_1
  if not (L2_1 > L3_1) then
    goto lbl_36
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_36::
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = 128
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L1_1 + 3526
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.crc32
L6_1 = -1
L7_1 = L4_1
L8_1 = 1
L9_1 = L3_1
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == 381009505 or L5_1 == 1730649905 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_60::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
