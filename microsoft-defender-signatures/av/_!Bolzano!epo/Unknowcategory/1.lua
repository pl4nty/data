local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Machine
if L0_1 < 332 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Machine
if 335 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 2600 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 < 2600 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L2_1 = 15
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.VirtualSize
L2_1 = 15
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\190H\n\000\000\003\245\191\197\f\000\000\003\253\185\n\000\000\000\243\165\139\157p\n\000\000f\199\003`\184"
L1_1.xray_type = 0
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232X\t\000\000\190\149\v\000\000\003\245\191\200\016\000"
L2_1.xray_type = 1
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\232B\t\000\000\190{\v\000\000\003\245\191\180\016\000"
L3_1.xray_type = 1
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "\232c\n\000\000\1909\r\000\000\003\245\191\004\018\000"
L4_1.xray_type = 1
L4_1.bytes_to_decrypt = 0
L5_1 = {}
L5_1.sig = "\232\135\t\000\000\190\196\v\000\000\003\245\191\252\016\000"
L5_1.xray_type = 1
L5_1.bytes_to_decrypt = 0
L6_1 = {}
L6_1.sig = "\232\006\n\000\000\190\152\f\000\000\003\245\191\176\018\000"
L6_1.xray_type = 1
L6_1.bytes_to_decrypt = 0
L7_1 = {}
L7_1.sig = "\232\220\a\000\000\1909\n\000\000\003\245\191\185\f\000"
L7_1.xray_type = 0
L7_1.bytes_to_decrypt = 0
L8_1 = {}
L8_1.sig = "\232\177\a\000\000\190\005\n\000\000\003\245\191\r\r\000"
L8_1.xray_type = 0
L8_1.bytes_to_decrypt = 0
L9_1 = {}
L9_1.sig = "\232-\t\000\000\190f\v\000\000\003\245\191\160\016\000"
L9_1.xray_type = 1
L9_1.bytes_to_decrypt = 0
L10_1 = {}
L10_1.sig = "\2326\014\000\000\191\000\f\001\000\185\000\001\000\0003\192\243\174u\f\190\143\016\000\000\191\000\000\240w\235"
L10_1.xray_type = 2
L10_1.bytes_to_decrypt = 0
L11_1 = {}
L11_1.sig = "\2328\014\000\000\191\000\f\001\000\185\000\001\000\0003\192\243\174u\f\190\145\016\000\000\191\000\000\240w\235"
L11_1.xray_type = 2
L11_1.bytes_to_decrypt = 0
L12_1 = {}
L12_1.sig = "\232\213\014\000\000\191\000\f\001\000\185\000\001\000\0003\192\243\174u\f\190-\017\000\000\191\000\000\240w\235"
L12_1.xray_type = 2
L12_1.bytes_to_decrypt = 0
L13_1 = {}
L13_1.sig = "\232i\t\000\000\190\166\v\000\000\003\245\191\216\016\000\000\003\253\185,\000\000\000\252\243\165\139\189V\f\000"
L13_1.xray_type = 2
L13_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L0_1[10] = L10_1
L0_1[11] = L11_1
L0_1[12] = L12_1
L0_1[13] = L13_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 13
L4_1 = -1
L5_1 = -8192
L6_1 = -4096
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
