local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
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
L0_1 = L0_1.lastscn_vfalign
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_eqsizes
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pesecs
L1_1 = L1_1[1]
L1_1 = L1_1.Characteristics
L2_1 = 2147483648
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\232\000\000\000\000]\129\237\005\016@\000\141\181'\023@\000\141\1890\023@\000\185\b\000\000\000\144\243\164"
L1_1.xray_type = 0
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232'\000\000\000\139\133F\023@\0001\133\213\023@\000\235&\144\144\144\232\017\000\000\000\139\133J\023@"
L2_1.xray_type = 0
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\232\v\000\000\000\139d$\b\232Y\000\000\000\235B3\219d\2553d\137#R\015\001L$\254Z\131"
L3_1.xray_type = 1
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "\232\v\000\000\000\139d$\b\232Z\000\000\000\235B3\219d\2553d\137#R\015\001L$\254Z\131"
L4_1.xray_type = 1
L4_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 4
L4_1 = -1
L5_1 = -4096
L6_1 = -256
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
