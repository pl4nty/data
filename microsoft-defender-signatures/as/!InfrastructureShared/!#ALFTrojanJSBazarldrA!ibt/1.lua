local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 327680 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.FOOTERPAGE_SZ
if L1_1 < 1792 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = footerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 0
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "function%("
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L2_1 = L2_1 + 1
  if 20 <= L2_1 then
    break
  end
end
if L2_1 < 20 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L2_1 = 0
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "{var "
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L2_1 = L2_1 + 1
  if 10 <= L2_1 then
    break
  end
end
if L2_1 < 10 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L2_1 = 0
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "return"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L2_1 = L2_1 + 1
  if 20 <= L2_1 then
    break
  end
end
if L2_1 < 20 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L2_1 = 0
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "_0x"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L2_1 = L2_1 + 1
  if 250 <= L2_1 then
    break
  end
end
if L2_1 < 250 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
