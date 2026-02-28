local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 1024 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 67324752 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 19
L0_1 = L0_1(L1_1, L2_1)
if L0_1 < 4096 or 67108864 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 27
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u16
L3_1 = headerpage
L4_1 = 29
L2_1 = L2_1(L3_1, L4_1)
if L1_1 < 4 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = string
L4_1 = L4_1.char
L5_1 = headerpage
L6_1 = 31 + L1_1
L6_1 = L6_1 - 4
L5_1 = L5_1[L6_1]
L6_1 = headerpage
L7_1 = 31 + L1_1
L7_1 = L7_1 - 3
L6_1 = L6_1[L7_1]
L7_1 = headerpage
L8_1 = 31 + L1_1
L8_1 = L8_1 - 2
L7_1 = L7_1[L8_1]
L8_1 = headerpage
L9_1 = 31 + L1_1
L9_1 = L9_1 - 1
L8_1 = L8_1[L9_1]
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L3_1 ~= ".exe" and L3_1 ~= ".pif" and L3_1 ~= ".scr" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = 30 + L1_1
L4_1 = L4_1 + L2_1
L4_1 = L4_1 + L0_1
L5_1 = mp
L5_1 = L5_1.getfilesize
L5_1 = L5_1()
L6_1 = L4_1 + 16
if L5_1 < L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = L4_1
L8_1 = 4
L6_1 = L6_1(L7_1, L8_1)
if L6_1 ~= "PK\003\004" then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:IOAVSingleEXEZip"
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.UfsSetMetadataBool
  L8_1 = "Lua:UfsIOAVSingleEXEZip"
  L9_1 = true
  L7_1(L8_1, L9_1)
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
