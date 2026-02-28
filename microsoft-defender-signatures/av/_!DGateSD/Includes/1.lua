local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.BasePath
if L1_1 then
  L1_1 = contains
  L2_1 = L0_1.BasePath
  L3_1 = "cmd.exe"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    goto lbl_24
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_24::
L1_1 = L0_1.Arguments
if not L1_1 then
  L1_1 = nil
end
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.lower
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "||"
L5_1 = ""
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
L5_1 = L1_1
L4_1 = L1_1.gsub
L6_1 = "&"
L7_1 = ""
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
if 2 < L3_1 and 2 < L5_1 then
  L6_1 = contains
  L7_1 = L1_1
  L8_1 = {}
  L9_1 = "p\"?i\"?n\"?g\"?"
  L10_1 = "e\"?c\"?h\"?o\"?"
  L8_1[1] = L9_1
  L8_1[2] = L10_1
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = contains
  L7_1 = L1_1
  L8_1 = {}
  L9_1 = "c\"?s\"?c\"?r\"?i\"?p\"?t\"?"
  L10_1 = "w\"?s\"?c\"?r\"?i\"?p\"?t\"?"
  L11_1 = "r\"?u\"?n\"?d\"?l\"?l\"?3\"?2\"?"
  L8_1[1] = L9_1
  L8_1[2] = L10_1
  L8_1[3] = L11_1
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = contains
  L7_1 = L1_1
  L8_1 = "c\"?u\"?r\"?l\"?%.?e?\"?x?\"?e?\"?%s+.*h\"?t\"?t\"?p\"?s?\"?"
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
