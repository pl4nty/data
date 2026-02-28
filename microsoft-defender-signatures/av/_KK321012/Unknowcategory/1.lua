local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pehdr
L0_1 = L0_1.Win32VersionValue
if L0_1 ~= 47806 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 1012 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\128|$\003\191\015\1333\001\000\000`\232\000\000\000\000]\129\237/\016@\000"
L1_1.xray_type = 0
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = -3
L5_1 = -1012
L6_1 = -512
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
