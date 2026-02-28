local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 29
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 22340 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.SizeOfRawData
if L0_1 <= 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "hMUTE\144\002\006hSYS_\144\002\006\137\144\002\a\232\144\000"
L1_1.xray_type = 9
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = 0
L5_1 = -16384
L6_1 = -1
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
