local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
L0_1 = L0_1.lastscn_valign
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "`\232\137\002\000\000\139\133\147\031@\0001\133\160\018"
L1_1.xray_type = 1
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "`\232\180\002\000\000\139\133\201\016A\0001\133\203\002"
L2_1.xray_type = 1
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "`\232\180\002\000\000\139\133\201 @\0001\133\203\018"
L3_1.xray_type = 1
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "`\232\137\002\000\000\139\133A\031@\0001\133\160\018"
L4_1.xray_type = 1
L4_1.bytes_to_decrypt = 0
L5_1 = {}
L5_1.sig = "\232Z\002\000\000X\141\149\000\016@\000+\208\001T"
L5_1.xray_type = 1
L5_1.bytes_to_decrypt = 0
L6_1 = {}
L6_1.sig = "\232Z\002\000\000X\141\149\000\016@\000+\208\001T"
L6_1.xray_type = 1
L6_1.bytes_to_decrypt = 0
L7_1 = {}
L7_1.sig = "`\232\137\002\000\000\139\133t\031@\0001\133\160\018"
L7_1.xray_type = 1
L7_1.bytes_to_decrypt = 0
L8_1 = {}
L8_1.sig = "`\232\137\002\000\000\139\133\147\015A\0001\133\160\002"
L8_1.xray_type = 1
L8_1.bytes_to_decrypt = 0
L9_1 = {}
L9_1.sig = "`\232\137\002\000\000\139\133t\015A\0001\133\160\002"
L9_1.xray_type = 1
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
L5_1 = -8192
L6_1 = -2048
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
