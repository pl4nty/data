local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 15) then
    goto lbl_26
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_26::
L1_1 = {}
L2_1 = "/s"
L3_1 = "/m"
L4_1 = "password"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = pairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L2_1 = {}
L3_1 = "*.*"
L4_1 = "*.xml *.ini *.txt *.tmp"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = pairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L0_1
  L10_1 = L7_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L4_1 = #L3_1
    if 1 < L4_1 then
      L4_1 = bm_AddRelatedFileFromCommandLine
      L5_1 = L3_1
      L6_1 = nil
      L7_1 = nil
      L8_1 = 1
      L4_1(L5_1, L6_1, L7_1, L8_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
