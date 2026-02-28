local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 ~= 232 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 <= 4182 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 <= 4182 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[4]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[5]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\232\000\000\000\000\189\n\000A\000\247\221X\003\232\v"
L1_1.xray_type = 13
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232\000\000\000\000\189\n\016@\000\247\221X\003\232\v"
L2_1.xray_type = 13
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\232\000\000\000\000\144\189\n\016@\000\247\221X\003\232"
L3_1.xray_type = 13
L3_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 3
L4_1 = -2
L5_1 = 0
L6_1 = 2048
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
