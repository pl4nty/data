local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if L0_1 ~= true then
    goto lbl_67
  end
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 270000 or 300000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
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
L3_1 = 128
L4_1 = 336
if L1_1 ~= 0 then
  L5_1 = L4_1 + L3_1
  if not (L2_1 < L5_1) and not (L0_1 <= L1_1) then
    L5_1 = L0_1 - L1_1
    if not (L2_1 > L5_1) then
      goto lbl_46
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_46::
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L1_1 + L4_1
L7_1 = L3_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.crc32
L7_1 = -1
L8_1 = L5_1
L9_1 = 1
L10_1 = L3_1
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 == 51922062 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
::lbl_67::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
