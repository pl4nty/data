local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 307200000 or 512000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ":\000\\\000W\000i\000n\000d\000o\000w\000s\000\\\000S\000y\000s\000t\000e\000m\0003\0002\000\\\000s\000v\000c\000h\000o\000s\000t\000.\000e\000x\000e\000\000"
L2_1 = "svchost.pdb"
L3_1 = "RdpCoreTS.pdb"
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = tostring
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = 8192
L7_1 = 24576
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L5_1 = tostring
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = 49152
L8_1 = 90112
L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = true
L6_1(L7_1)
L7_1 = L4_1
L6_1 = L4_1.find
L8_1 = L1_1
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 ~= nil then
  L7_1 = L5_1
  L6_1 = L5_1.find
  L8_1 = L2_1
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L7_1 = L5_1
    L6_1 = L5_1.find
    L8_1 = L3_1
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      goto lbl_60
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_60::
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
