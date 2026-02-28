local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pehdr
L0_1 = L0_1.MinorImageVersion
if L0_1 ~= 106 then
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
L0_1 = L0_1.lastscn_valign
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 1024 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 < 1024 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "`\141l$ \232\006\000\000\000\139d$\b\235'dg\2556\000\000dg\137&\000\000\232\000\000\000"
L1_1.xray_type = 0
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "`\141l$ \232\t\000\000\000\139d$\b\235+\144\144\144dg\2556\000\000dg\137&\000\000\232"
L2_1.xray_type = 0
L2_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 2
L4_1 = -1
L5_1 = -2048
L6_1 = -1024
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
