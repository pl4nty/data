local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 256 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
L1_1 = false
if L0_1 == 640 then
  L1_1 = true
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:PKL_Protocol_V2"
  L2_1(L3_1)
elseif L0_1 == 896 then
  L1_1 = true
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:PKL_Protocol_V3"
  L2_1(L3_1)
elseif L0_1 == 1152 then
  L1_1 = true
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:PKL_Protocol_V4"
  L2_1(L3_1)
elseif L0_1 == 1408 then
  L1_1 = true
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:PKL_Protocol_V5"
  L2_1(L3_1)
end
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "BM_PKL_FILE"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
