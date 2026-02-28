local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epscn_islast
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
if L0_1 < 12960 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 < 12960 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "_\131\199\024\139\015\137\141\1613\000\000\139O\004\137\141\1653\000\000f\171f\175\180\238\137\a\006\030\015"
L1_1.xray_type = 8
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = -2
L5_1 = -13024
L6_1 = -12512
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
