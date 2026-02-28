local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[17]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[17]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = normalize_path
    L3_1 = this_sigattrlog
    L3_1 = L3_1[17]
    L3_1 = L3_1.utf8p1
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    L0_1 = L1_1
  end
end
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = normalize_path
L4_1 = L1_1
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L1_1 = L2_1
L2_1 = "Posilod"
L3_1 = nil
L4_1 = pcall
L5_1 = MpCommon
L5_1 = L5_1.RollingQueueQueryKeyNamespaced
L6_1 = L1_1
L7_1 = L2_1
L8_1 = "CreatedByPPID"
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == true then
  L3_1 = L5_1.value
end
L6_1 = isnull
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = nil
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.RollingQueueQueryKeyNamespaced
L9_1 = L0_1
L10_1 = L2_1
L11_1 = "CreatedByPPID"
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 == true then
  L6_1 = L8_1.value
end
L9_1 = isnull
L10_1 = L6_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L3_1 == L6_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
