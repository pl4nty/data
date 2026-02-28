local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = pehdr
L0_1 = L0_1.Subsystem
if L0_1 == 3 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.SizeOfStackReserve
if L0_1 < 65536 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.SizeOfStackCommit
if L0_1 < 65536 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pevars
L0_1 = L0_1.epsec
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L0_1 > L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pesecs
L2_1 = pevars
L2_1 = L2_1.epsec
L1_1 = L1_1[L2_1]
L1_1 = L1_1.Characteristics
L2_1 = 536870912
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 536870912 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 <= 8192 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 <= 8192 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_falign
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.packed
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\232\000\000\000\000]\232\232\003\000\000jEY\141\181\0064\000\000\232\f\004\000\000\141\133\188\000\000\000T"
L1_1.xray_type = 17
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181\1975\000\000\232\155\004\000\000\141\133\188\000\000\000T"
L2_1.xray_type = 17
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181\1985\000\000\232\155\004\000\000\141\133\188\000\000\000T"
L3_1.xray_type = 17
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "\232\000\000\000\000]\232-\004\000\000jEY\141\181\2125\000\000\232Q\004\000\000\141\133\188\000\000\000T"
L4_1.xray_type = 17
L4_1.bytes_to_decrypt = 0
L5_1 = {}
L5_1.sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181\0307\000\000\232\155\004\000\000\141\133\188\000\000\000T"
L5_1.xray_type = 17
L5_1.bytes_to_decrypt = 0
L6_1 = {}
L6_1.sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181(7\000\000\232\155\004\000\000\141\133\188\000\000\000T"
L6_1.xray_type = 18
L6_1.bytes_to_decrypt = 0
L7_1 = {}
L7_1.sig = "\232\000\000\000\000]\232\188\004\000\000jEY\141\181\1977\000\000\232\224\004\000\000\141\133\188\000\000\000T"
L7_1.xray_type = 17
L7_1.bytes_to_decrypt = 0
L8_1 = {}
L8_1.sig = "\232\000\000\000\000]\232\188\004\000\000jEY\141\181\0309\000\000\232\224\004\000\000\141\133\188\000\000\000T"
L8_1.xray_type = 17
L8_1.bytes_to_decrypt = 0
L9_1 = {}
L9_1.sig = "\232\000\000\000\000]\232\188\004\000\000jEY\141\181(9\000\000\232\224\004\000\000\141\133\188\000\000\000T"
L9_1.xray_type = 18
L9_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 9
L4_1 = -1
L5_1 = -40960
L6_1 = -12288
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
