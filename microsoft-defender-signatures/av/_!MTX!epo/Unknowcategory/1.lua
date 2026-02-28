local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
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
if L0_1 < 9245 then
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
L0_1 = {}
L1_1 = {}
L1_1.sig = "\156`\233\000\000\000\000\190\144\001\004\139\254\185\144\001\002\000\000\252\173\144\001\015\171\226\237\235\004\144\000"
L1_1.xray_type = 9
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "dg\2556\000\000dg\137&\000\000\139H<\139T\b4;\194u\218\139\234\003\193\005\128\000\000\000"
L2_1.xray_type = 0
L2_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 2
L4_1 = -1
L5_1 = -10000
L6_1 = -6000
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
