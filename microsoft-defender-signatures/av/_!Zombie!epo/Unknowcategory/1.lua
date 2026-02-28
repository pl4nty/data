local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pehdr
L0_1 = L0_1.MinorLinkerVersion
if L0_1 ~= 19 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_eqsizes
if L0_1 ~= true then
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
L1_1.sig = "\232\006\000\000\000\139d$\b\235Y3\201d\2551d\137!9\vuM9K\004uH\140\200\131\224"
L1_1.xray_type = 0
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232\006\000\000\000r\237\248\195\249\195S\232\t\000\000\000\139d$\b\235\127\144\144\1443\201d\2551d"
L2_1.xray_type = 0
L2_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 2
L4_1 = -1
L5_1 = -8192
L6_1 = -2048
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
