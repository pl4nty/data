local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 160 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.find
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = "`\000\000\000\003\000\000\160X\000\000\000\000\000\000\000"
L3_1 = 1
L4_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1 + 15
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = L1_1
L4_1 = 81
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = tostring
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = "[^%z]+"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.len
L4_1 = L4_1(L5_1)
L4_1 = L4_1 + 28
L5_1 = L4_1 + 6
L7_1 = L2_1
L6_1 = L2_1.len
L6_1 = L6_1(L7_1)
if L5_1 > L6_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readu_u16
L6_1 = L2_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.readu_u32
L7_1 = L2_1
L8_1 = L4_1 + 2
L6_1 = L6_1(L7_1, L8_1)
L7_1 = mp
L7_1 = L7_1.bitor
L8_1 = mp
L8_1 = L8_1.shl64
L9_1 = L6_1
L10_1 = 16
L8_1 = L8_1(L9_1, L10_1)
L9_1 = L5_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == 176857451942096 or L7_1 == 81286657363968 then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:LNKAdwind"
  L8_1(L9_1)
end
L8_1 = L3_1
L9_1 = tostring
L10_1 = L7_1
L9_1 = L9_1(L10_1)
L8_1 = L8_1 .. L9_1
L9_1 = crypto
L9_1 = L9_1.Sha1Buffer
L10_1 = L8_1
L11_1 = 0
L12_1 = #L8_1
L9_1 = L9_1(L10_1, L11_1, L12_1)
L10_1 = mp
L10_1 = L10_1.set_mpattribute
L11_1 = "MpInternal_researchdata=LHMAD="
L12_1 = L9_1
L11_1 = L11_1 .. L12_1
L10_1(L11_1)
L10_1 = 229
L11_1 = MpCommon
L11_1 = L11_1.SNidSearch
L12_1 = L10_1
L13_1 = L9_1
L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
if L11_1 then
  L14_1 = mp
  L14_1 = L14_1.changedetectionrecid
  L15_1 = L13_1
  L14_1(L15_1)
  L14_1 = mp
  L14_1 = L14_1.INFECTED
  return L14_1
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
